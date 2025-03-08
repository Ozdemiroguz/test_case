import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_case/core/models/failure/failure.dart';
import 'package:test_case/features/profile/domain/models/profile_model.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  factory ProfileState({
    required bool isLoading,
    required ProfileModel profile,
    required bool languageChanged,
    required Option<Failure> failure,
  }) = _ProfileState;

  factory ProfileState.initial() => ProfileState(
        isLoading: false,
        languageChanged: false,
        profile: ProfileModel.empty(),
        failure: none(),
      );

  const ProfileState._();
}
