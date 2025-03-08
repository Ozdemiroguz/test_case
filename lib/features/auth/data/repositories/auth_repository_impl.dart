// ignore_for_file: avoid_dynamic_calls

import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:test_case/constants/api_endpoints.dart';
import 'package:test_case/core/models/failure/failure.dart';

import '../../../../constants/failure_message.dart';
import '../../../../services/locale/locale_resources_service.dart';
import '../../../../services/network/network_service.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final NetworkService networkService;
  final LocaleResourcesService localeResourcesService;

  AuthRepositoryImpl(
      {required this.networkService, required this.localeResourcesService});

  @override
  Future<bool> isTokenExpired() async {
    final token = await localeResourcesService.getAccessToken();

    if (token.isNone()) return true;

    final isExpired = JwtDecoder.isExpired(token.toNullable()!);
    // const isExpired = ;

    if (isExpired) {
      await localeResourcesService.clearSecureStorage();
      networkService.clearToken();
    } else {
      log(token.toNullable() ?? "Token is null");
      networkService.setToken(token.toNullable()!);
    }

    return isExpired;
  }

  Future<Option<Failure>> _handleAuthResponse(Map<String, dynamic> data) async {
    // Token'ı data["data"] içinden çekiyoruz.
    final token = data['data']?['token'];

    if (token != null && token is String) {
      try {
        log(token);
        networkService.setToken(token);
        await localeResourcesService.setAccessToken(token);

        // Kullanıcı id'si de data["data"] içinden çekiliyor.
        final userId = data['data']?['_id'] as String?;
        if (userId != null) {
          await localeResourcesService.setUserId(userId);
        }
        return none();
      } catch (e) {
        return some(Failure.unknownError(unknownErrorMessage));
      }
    } else {
      return some(Failure.unknownError(unknownErrorMessage));
    }
  }

  Future<Option<Failure>> login({
    required String email,
    required String password,
  }) async {
    final result = await networkService.post(
      Endpoints.login,
      data: {
        "email": email,
        "password": password,
      },
    );
    return await result.fold(
      (l) => some(Failure.auth(l.message)),
      (r) => optionOf(r.data).fold(
        () => some(Failure.unknownError(unknownErrorMessage)),
        (data) => _handleAuthResponse(data),
      ),
    );
  }

  @override
  Future<Option<Failure>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final result = await networkService.post(
      Endpoints.register,
      data: {
        "email": email,
        "name": name,
        "password": password,
      },
    );
    return await result.fold(
      (l) => some(Failure.auth(l.message)),
      (r) => optionOf(r.data).fold(
        () => some(Failure.unknownError(unknownErrorMessage)),
        (data) => _handleAuthResponse(data),
      ),
    );
  }

  Future<Option<Failure>> logout() async {
    try {
      await localeResourcesService.clearSecureStorage();
      networkService.clearToken();
      return none();
    } catch (e) {
      return some(Failure.unknownError(unknownErrorMessage));
    }
  }
}
