import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:test_case/core/models/failure/failure.dart';
import 'package:test_case/features/profile/domain/models/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, String>> uploadProfilePhoto(File file);
}
