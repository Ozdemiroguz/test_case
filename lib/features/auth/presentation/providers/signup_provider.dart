import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
import '../../../../core/models/validation_error_visibility/validation_error_visibility.dart';
import '../../../../utils/validators.dart';
import '../states/signup_state.dart';

final signupProvider =
    NotifierProvider.autoDispose<_SignupNotifier, SignupState>(
        _SignupNotifier.new);

class _SignupNotifier extends AutoDisposeNotifier<SignupState> {
  @override
  SignupState build() => SignupState.initial();

  Future<void> signUp() async {
    state = state.copyWith(isLoading: true);

    final result = await ref.read(authRepositoryProvider).signUp(
          email: state.email,
          password: state.password,
          name: state.name,
        );

    state = state.copyWith(failure: result, isLoading: false);
  }

  void onNameChanged(String? value) {
    state = state.copyWith(
      name: value ?? "",
    );
  }

  void onEmailChanged(String? value) {
    state = state.copyWith(
      email: value ?? "",
      emailFailure: validateEmailAddress(value ?? ""),
    );
  }

  void onPasswordChanged(String? value) {
    state = state.copyWith(
      password: value ?? "",
      passwordFailure: validatePassword(value ?? ""),
    );
  }

  void onConfirmPasswordChanged(String? value) {
    state = state.copyWith(
      confirmPassword: value ?? "",
    );

    state = state.copyWith(
      confirmPasswordFailure: validateConfirmPassword(
        state.password,
        state.confirmPassword,
        "passwords_do_not_match".tr(),
      ),
    );
  }

  void showValidationErrors() {
    state = state.copyWith(
        validationErrorVisibility: const ValidationErrorVisibility.show());
  }
}
