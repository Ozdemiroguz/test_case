// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignupState {
  bool get isLoading;
  String get name;
  String get email;
  String get password;
  String get confirmPassword;
  Option<Failure> get failure;
  Option<ValueFailure> get emailFailure;
  Option<ValueFailure> get passwordFailure;
  Option<ValueFailure> get confirmPasswordFailure;
  ValidationErrorVisibility get validationErrorVisibility;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignupStateCopyWith<SignupState> get copyWith =>
      _$SignupStateCopyWithImpl<SignupState>(this as SignupState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignupState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.emailFailure, emailFailure) ||
                other.emailFailure == emailFailure) &&
            (identical(other.passwordFailure, passwordFailure) ||
                other.passwordFailure == passwordFailure) &&
            (identical(other.confirmPasswordFailure, confirmPasswordFailure) ||
                other.confirmPasswordFailure == confirmPasswordFailure) &&
            (identical(other.validationErrorVisibility,
                    validationErrorVisibility) ||
                other.validationErrorVisibility == validationErrorVisibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      name,
      email,
      password,
      confirmPassword,
      failure,
      emailFailure,
      passwordFailure,
      confirmPasswordFailure,
      validationErrorVisibility);

  @override
  String toString() {
    return 'SignupState(isLoading: $isLoading, name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, failure: $failure, emailFailure: $emailFailure, passwordFailure: $passwordFailure, confirmPasswordFailure: $confirmPasswordFailure, validationErrorVisibility: $validationErrorVisibility)';
  }
}

/// @nodoc
abstract mixin class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) _then) =
      _$SignupStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String name,
      String email,
      String password,
      String confirmPassword,
      Option<Failure> failure,
      Option<ValueFailure> emailFailure,
      Option<ValueFailure> passwordFailure,
      Option<ValueFailure> confirmPasswordFailure,
      ValidationErrorVisibility validationErrorVisibility});

  $ValidationErrorVisibilityCopyWith<$Res> get validationErrorVisibility;
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res> implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._self, this._then);

  final SignupState _self;
  final $Res Function(SignupState) _then;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? failure = null,
    Object? emailFailure = null,
    Object? passwordFailure = null,
    Object? confirmPasswordFailure = null,
    Object? validationErrorVisibility = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      emailFailure: null == emailFailure
          ? _self.emailFailure
          : emailFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      passwordFailure: null == passwordFailure
          ? _self.passwordFailure
          : passwordFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      confirmPasswordFailure: null == confirmPasswordFailure
          ? _self.confirmPasswordFailure
          : confirmPasswordFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      validationErrorVisibility: null == validationErrorVisibility
          ? _self.validationErrorVisibility
          : validationErrorVisibility // ignore: cast_nullable_to_non_nullable
              as ValidationErrorVisibility,
    ));
  }

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationErrorVisibilityCopyWith<$Res> get validationErrorVisibility {
    return $ValidationErrorVisibilityCopyWith<$Res>(
        _self.validationErrorVisibility, (value) {
      return _then(_self.copyWith(validationErrorVisibility: value));
    });
  }
}

/// @nodoc

class _SignupState extends SignupState {
  _SignupState(
      {required this.isLoading,
      required this.name,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.failure,
      required this.emailFailure,
      required this.passwordFailure,
      required this.confirmPasswordFailure,
      required this.validationErrorVisibility})
      : super._();

  @override
  final bool isLoading;
  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final Option<Failure> failure;
  @override
  final Option<ValueFailure> emailFailure;
  @override
  final Option<ValueFailure> passwordFailure;
  @override
  final Option<ValueFailure> confirmPasswordFailure;
  @override
  final ValidationErrorVisibility validationErrorVisibility;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignupStateCopyWith<_SignupState> get copyWith =>
      __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignupState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.emailFailure, emailFailure) ||
                other.emailFailure == emailFailure) &&
            (identical(other.passwordFailure, passwordFailure) ||
                other.passwordFailure == passwordFailure) &&
            (identical(other.confirmPasswordFailure, confirmPasswordFailure) ||
                other.confirmPasswordFailure == confirmPasswordFailure) &&
            (identical(other.validationErrorVisibility,
                    validationErrorVisibility) ||
                other.validationErrorVisibility == validationErrorVisibility));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      name,
      email,
      password,
      confirmPassword,
      failure,
      emailFailure,
      passwordFailure,
      confirmPasswordFailure,
      validationErrorVisibility);

  @override
  String toString() {
    return 'SignupState(isLoading: $isLoading, name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, failure: $failure, emailFailure: $emailFailure, passwordFailure: $passwordFailure, confirmPasswordFailure: $confirmPasswordFailure, validationErrorVisibility: $validationErrorVisibility)';
  }
}

/// @nodoc
abstract mixin class _$SignupStateCopyWith<$Res>
    implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(
          _SignupState value, $Res Function(_SignupState) _then) =
      __$SignupStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String name,
      String email,
      String password,
      String confirmPassword,
      Option<Failure> failure,
      Option<ValueFailure> emailFailure,
      Option<ValueFailure> passwordFailure,
      Option<ValueFailure> confirmPasswordFailure,
      ValidationErrorVisibility validationErrorVisibility});

  @override
  $ValidationErrorVisibilityCopyWith<$Res> get validationErrorVisibility;
}

/// @nodoc
class __$SignupStateCopyWithImpl<$Res> implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(this._self, this._then);

  final _SignupState _self;
  final $Res Function(_SignupState) _then;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? failure = null,
    Object? emailFailure = null,
    Object? passwordFailure = null,
    Object? confirmPasswordFailure = null,
    Object? validationErrorVisibility = null,
  }) {
    return _then(_SignupState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      emailFailure: null == emailFailure
          ? _self.emailFailure
          : emailFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      passwordFailure: null == passwordFailure
          ? _self.passwordFailure
          : passwordFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      confirmPasswordFailure: null == confirmPasswordFailure
          ? _self.confirmPasswordFailure
          : confirmPasswordFailure // ignore: cast_nullable_to_non_nullable
              as Option<ValueFailure>,
      validationErrorVisibility: null == validationErrorVisibility
          ? _self.validationErrorVisibility
          : validationErrorVisibility // ignore: cast_nullable_to_non_nullable
              as ValidationErrorVisibility,
    ));
  }

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationErrorVisibilityCopyWith<$Res> get validationErrorVisibility {
    return $ValidationErrorVisibilityCopyWith<$Res>(
        _self.validationErrorVisibility, (value) {
      return _then(_self.copyWith(validationErrorVisibility: value));
    });
  }
}

// dart format on
