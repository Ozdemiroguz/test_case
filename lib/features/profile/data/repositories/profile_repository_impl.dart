// Repository Uygulaması
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:test_case/constants/api_endpoints.dart';
import 'package:test_case/core/models/failure/failure.dart';
import 'package:test_case/features/home/domain/models/movie.dart';
import 'package:test_case/features/profile/domain/models/profile_model.dart';
import 'package:test_case/features/profile/domain/repositories/profile_repository.dart';
import 'package:test_case/services/network/network_service.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final NetworkService networkService;

  ProfileRepositoryImpl(this.networkService);

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    final result = await networkService.get(Endpoints.profile);
    return result.fold(
      (failure) => left(failure),
      (response) {
        // Başarılı yanıtın beklenen yapısı: { response: {...}, data: { id,name,email,photoUrl } }
        final data = response.data?['data'];
        if (data != null && data is Map<String, dynamic>) {
          final profile = ProfileModel.fromJson(data);
          return right(profile);
        } else {
          return left(Failure.unknownError('Profile data not found'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, String>> uploadProfilePhoto(File file) async {
    File compressedFile;

    // 1. Resmi sıkıştırma işlemi
    try {
      compressedFile = await FlutterNativeImage.compressImage(
        file.path,
        quality:
            80, // Kalite değeri (0-100); daha düşük boyut için düşünebilirsiniz.
        targetWidth: 800, // İsteğe bağlı: hedef genişlik.
        targetHeight: 800, // İsteğe bağlı: hedef yükseklik.
      );
    } catch (e) {
      return left(Failure.unknownError('Image compression failed: $e'));
    }

    // 2. Sıkıştırılmış resmi sunucuya yükleme işlemi
    try {
      final fileName = compressedFile.path.split('/').last;
      final formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(compressedFile.path,
            filename: fileName),
      });

      final result = await networkService.post(
        Endpoints.upload_photo,
        data: formData,
        optionalHeaders: {"Content-Type": "multipart/form-data"},
      );

      return result.fold(
        (failure) => left(failure),
        (response) {
          final data = response.data?['data'];
          if (data != null &&
              data is Map<String, dynamic> &&
              data['photoUrl'] != null) {
            return right(data['photoUrl'].toString());
          } else {
            return left(Failure.unknownError(
                'Photo upload failed: Invalid response data'));
          }
        },
      );
    } catch (e) {
      return left(Failure.unknownError('Photo upload failed: $e'));
    }
  }
}
