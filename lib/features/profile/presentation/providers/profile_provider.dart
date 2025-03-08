import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_case/features/profile/presentation/states/profile/profile_state.dart';

import '../../../../core/injections/locator.dart';

// HomeNotifier provider'ı
final profileProvider =
    NotifierProvider<_ProfileNotifier, ProfileState>(_ProfileNotifier.new);

final class _ProfileNotifier extends Notifier<ProfileState> {
  @override
  ProfileState build() {
    // Build aşamasında asenkron initial load başlatılır.
    Future(() => init());
    return ProfileState.initial();
  }

  Future<void> init() async {
    setLoading(true);
    // İlk sayfa ve favori filmleri yüklüyoruz.
    getProfile();
    setLoading(false);
  }

  Future<void> getProfile() async {
    setLoading(true);
    final result = await ref.read(profileRepositoryProvider).getProfile();
    result.fold(
      (failure) {
        state = state.copyWith(failure: some(failure));
        setLoading(false);
      },
      (profile) {
        state = state.copyWith(profile: profile);
        setLoading(false);
      },
    );
  }

  Future<void> logout() async {
    setLoading(true);
    final result = await ref.read(authRepositoryProvider).logout();

    result.fold(
      () {
        state = state.copyWith(failure: none());
      },
      (failure) {
        state = state.copyWith(failure: some(failure));
      },
    );
  }

  void setLanguageChanged() {
    final isChanged = !state.languageChanged;
    state = state.copyWith(languageChanged: isChanged);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
