import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_case/features/profile/presentation/states/profile_image_update/profile_image_update_state.dart';

import '../../../../core/injections/locator.dart';

final profileImageUpdateProvider = NotifierProvider.autoDispose<
    _ProfileImageNotifier, ProfileImageUpdateState>(_ProfileImageNotifier.new);

class _ProfileImageNotifier
    extends AutoDisposeNotifier<ProfileImageUpdateState> {
  @override
  ProfileImageUpdateState build() => ProfileImageUpdateState.initial();

  void onProfileImageChanged(String? value) {
    state = state.copyWith(
      profileImagePath: value ?? "",
    );
  }

  void onProfileImagePathChanged(String? value) {
    state =
        state.copyWith(profileImagePath: value ?? "", profileImageUrl: null);
  }

  Future<void> updateProfileImage(String filePath) async {
    state = state.copyWith(isLoading: true);

    final result = await ref.read(profileRepositoryProvider).uploadProfilePhoto(
          File(filePath),
        );

    result.fold(
      (failure) {
        print("Failure: $failure");
        state = state.copyWith(failure: some(failure), isLoading: false);
      },
      (profileImageUrl) {
        print("Profile Image Url: $profileImageUrl");
        state = state.copyWith(
          profileImageUrl: profileImageUrl,
          isLoading: false,
        );
      },
    );
  }
}
