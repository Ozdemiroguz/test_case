import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';

part 'profile_image_update_state.freezed.dart';

@freezed
abstract class ProfileImageUpdateState with _$ProfileImageUpdateState {
  factory ProfileImageUpdateState({
    required bool isLoading,
    required String? profileImageUrl,
    required String? profileImagePath,
    required Option<Failure> failure,
  }) = _ProfileImageUpdateState;

  factory ProfileImageUpdateState.initial() => ProfileImageUpdateState(
        isLoading: false,
        profileImageUrl: null,
        profileImagePath: null,
        failure: none(),
      );

  const ProfileImageUpdateState._();
}
