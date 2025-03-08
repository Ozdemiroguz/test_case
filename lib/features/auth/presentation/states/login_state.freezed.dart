// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginState {
  bool get isLoading;
  String get email;
  String get password;
  Option<Failure> get failure;
  Option<ValueFailure> get emailFailure;
  Option<ValueFailure> get passwordFailure;
  ValidationErrorVisibility get validationErrorVisibility;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginStateCopyWith<LoginState> get copyWith =>
      _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.emailFailure, emailFailure) ||
                other.emailFailure == emailFailure) &&
            (identical(other.passwordFailure, passwordFailure) ||
                other.passwordFailure == passwordFailure) &&
            (identical(other.validationErrorVisibility,
                    validationErrorVisibility) ||
                other.validationErrorVisibility == validationErrorVisibility));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, email, password,
      failure, emailFailure, passwordFailure, validationErrorVisibility);

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, email: $email, password: $password, failure: $failure, emailFailure: $emailFailure, passwordFailure: $passwordFailure, validationErrorVisibility: $validationErrorVisibility)';
  }
}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) _then) =
      _$LoginStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String email,
      String password,
      Option<Failure> failure,
      Option<ValueFailure> emailFailure,
      Option<ValueFailure> passwordFailure,
      ValidationErrorVisibility validationErrorVisibility});

  $ValidationErrorVisibilityCopyWith<$Res> get validationErrorVisibility;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? email = null,
    Object? password = null,
    Object? failure = null,
    Object? emailFailure = null,
    Object? passwordFailure = null,
    Object? validationErrorVisibility = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
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
      validationErrorVisibility: null == validationErrorVisibility
          ? _self.validationErrorVisibility
          : validationErrorVisibility // ignore: cast_nullable_to_non_nullable
              as ValidationErrorVisibility,
    ));
  }

  /// Create a copy of LoginState
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

class _LoginState extends LoginState {
  _LoginState(
      {required this.isLoading,
      required this.email,
      required this.password,
      required this.failure,
      required this.emailFailure,
      required this.passwordFailure,
      required this.validationErrorVisibility})
      : super._();

  @override
  final bool isLoading;
  @override
  final String email;
  @override
  final String password;
  @override
  final Option<Failure> failure;
  @override
  final Option<ValueFailure> emailFailure;
  @override
  final Option<ValueFailure> passwordFailure;
  @override
  final ValidationErrorVisibility validationErrorVisibility;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.emailFailure, emailFailure) ||
                other.emailFailure == emailFailure) &&
            (identical(other.passwordFailure, passwordFailure) ||
                other.passwordFailure == passwordFailure) &&
            (identical(other.validationErrorVisibility,
                    validationErrorVisibility) ||
                other.validationErrorVisibility == validationErrorVisibility));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, email, password,
      failure, emailFailure, passwordFailure, validationErrorVisibility);

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, email: $email, password: $password, failure: $failure, emailFailure: $emailFailure, passwordFailure: $passwordFailure, validationErrorVisibility: $validationErrorVisibility)';
  }
}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) _then) =
      __$LoginStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String email,
      String password,
      Option<Failure> failure,
      Option<ValueFailure> emailFailure,
      Option<ValueFailure> passwordFailure,
      ValidationErrorVisibility validationErrorVisibility});

  @override
  $ValidationErrorVisibilityCopyWith<$Res> get validationErrorVisibility;
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? email = null,
    Object? password = null,
    Object? failure = null,
    Object? emailFailure = null,
    Object? passwordFailure = null,
    Object? validationErrorVisibility = null,
  }) {
    return _then(_LoginState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
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
      validationErrorVisibility: null == validationErrorVisibility
          ? _self.validationErrorVisibility
          : validationErrorVisibility // ignore: cast_nullable_to_non_nullable
              as ValidationErrorVisibility,
    ));
  }

  /// Create a copy of LoginState
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
