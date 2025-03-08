// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_image_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileImageUpdateState {
  bool get isLoading;
  String? get profileImageUrl;
  String? get profileImagePath;
  Option<Failure> get failure;

  /// Create a copy of ProfileImageUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileImageUpdateStateCopyWith<ProfileImageUpdateState> get copyWith =>
      _$ProfileImageUpdateStateCopyWithImpl<ProfileImageUpdateState>(
          this as ProfileImageUpdateState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileImageUpdateState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.profileImagePath, profileImagePath) ||
                other.profileImagePath == profileImagePath) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, profileImageUrl, profileImagePath, failure);

  @override
  String toString() {
    return 'ProfileImageUpdateState(isLoading: $isLoading, profileImageUrl: $profileImageUrl, profileImagePath: $profileImagePath, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $ProfileImageUpdateStateCopyWith<$Res> {
  factory $ProfileImageUpdateStateCopyWith(ProfileImageUpdateState value,
          $Res Function(ProfileImageUpdateState) _then) =
      _$ProfileImageUpdateStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      String? profileImageUrl,
      String? profileImagePath,
      Option<Failure> failure});
}

/// @nodoc
class _$ProfileImageUpdateStateCopyWithImpl<$Res>
    implements $ProfileImageUpdateStateCopyWith<$Res> {
  _$ProfileImageUpdateStateCopyWithImpl(this._self, this._then);

  final ProfileImageUpdateState _self;
  final $Res Function(ProfileImageUpdateState) _then;

  /// Create a copy of ProfileImageUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? profileImageUrl = freezed,
    Object? profileImagePath = freezed,
    Object? failure = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImagePath: freezed == profileImagePath
          ? _self.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _ProfileImageUpdateState extends ProfileImageUpdateState {
  _ProfileImageUpdateState(
      {required this.isLoading,
      required this.profileImageUrl,
      required this.profileImagePath,
      required this.failure})
      : super._();

  @override
  final bool isLoading;
  @override
  final String? profileImageUrl;
  @override
  final String? profileImagePath;
  @override
  final Option<Failure> failure;

  /// Create a copy of ProfileImageUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileImageUpdateStateCopyWith<_ProfileImageUpdateState> get copyWith =>
      __$ProfileImageUpdateStateCopyWithImpl<_ProfileImageUpdateState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileImageUpdateState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.profileImagePath, profileImagePath) ||
                other.profileImagePath == profileImagePath) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, profileImageUrl, profileImagePath, failure);

  @override
  String toString() {
    return 'ProfileImageUpdateState(isLoading: $isLoading, profileImageUrl: $profileImageUrl, profileImagePath: $profileImagePath, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$ProfileImageUpdateStateCopyWith<$Res>
    implements $ProfileImageUpdateStateCopyWith<$Res> {
  factory _$ProfileImageUpdateStateCopyWith(_ProfileImageUpdateState value,
          $Res Function(_ProfileImageUpdateState) _then) =
      __$ProfileImageUpdateStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? profileImageUrl,
      String? profileImagePath,
      Option<Failure> failure});
}

/// @nodoc
class __$ProfileImageUpdateStateCopyWithImpl<$Res>
    implements _$ProfileImageUpdateStateCopyWith<$Res> {
  __$ProfileImageUpdateStateCopyWithImpl(this._self, this._then);

  final _ProfileImageUpdateState _self;
  final $Res Function(_ProfileImageUpdateState) _then;

  /// Create a copy of ProfileImageUpdateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? profileImageUrl = freezed,
    Object? profileImagePath = freezed,
    Object? failure = null,
  }) {
    return _then(_ProfileImageUpdateState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      profileImageUrl: freezed == profileImageUrl
          ? _self.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImagePath: freezed == profileImagePath
          ? _self.profileImagePath
          : profileImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

// dart format on
