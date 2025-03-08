import 'package:fpdart/fpdart.dart';
import 'package:test_case/core/models/failure/failure.dart';

abstract interface class AuthRepository {
  Future<bool> isTokenExpired();
  Future<Option<Failure>> login({
    required String email,
    required String password,
  });
  Future<Option<Failure>> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<Option<Failure>> logout();
}
