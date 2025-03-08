import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../core/models/validation_error_visibility/validation_error_visibility.dart';
import '../../../../core/models/value_failure/value_failure.dart';

part 'signup_state.freezed.dart';

@freezed
abstract class SignupState with _$SignupState {
  factory SignupState({
    required bool isLoading,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required Option<Failure> failure,
    required Option<ValueFailure> emailFailure,
    required Option<ValueFailure> passwordFailure,
    required Option<ValueFailure> confirmPasswordFailure,
    required ValidationErrorVisibility validationErrorVisibility,
  }) = _SignupState;

  factory SignupState.initial() => SignupState(
        isLoading: false,
        name: "",
        email: "",
        password: "",
        confirmPassword: "",
        failure: none(),
        emailFailure: none(),
        passwordFailure: none(),
        confirmPasswordFailure: none(),
        validationErrorVisibility: const ValidationErrorVisibility.hide(),
      );

  const SignupState._();

  bool get isValid => emailFailure.isNone() && passwordFailure.isNone();
}
