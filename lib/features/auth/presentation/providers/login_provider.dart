import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
import '../../../../core/models/validation_error_visibility/validation_error_visibility.dart';
import '../../../../utils/validators.dart';
import '../states/login_state.dart';

final loginProvider = NotifierProvider.autoDispose<_LoginNotifier, LoginState>(
    _LoginNotifier.new);

class _LoginNotifier extends AutoDisposeNotifier<LoginState> {
  @override
  LoginState build() => LoginState.initial();

  Future<void> login() async {
    state = state.copyWith(isLoading: true);
    final result = await ref.read(authRepositoryProvider).login(
          email: state.email,
          password: state.password,
        );

    state = state.copyWith(failure: result, isLoading: false);
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

  void showValidationErrors() {
    state = state.copyWith(
        validationErrorVisibility: const ValidationErrorVisibility.show());
  }
}
