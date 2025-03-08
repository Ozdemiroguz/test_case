// Repository Uygulaması
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_case/constants/api_endpoints.dart';
import 'package:test_case/core/models/failure/failure.dart';
import 'package:test_case/features/profile/domain/models/profile_model.dart';
import 'package:test_case/features/profile/domain/repositories/profile_repository.dart';
import 'package:test_case/services/network/network_service.dart';
import 'package:path/path.dart' as path;

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

    try {
      final dir = await getTemporaryDirectory();
      final targetPath =
          path.join(dir.path, 'compressed_${path.basename(file.path)}');

      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 80, // Kalite değeri (0-100)
        minWidth: 800, // Hedef genişlik
        minHeight: 800, // Hedef yükseklik
      );

      if (result == null) {
        return left(Failure.unknownError('Image compression failed'));
      }

      compressedFile = File(result.path);
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
