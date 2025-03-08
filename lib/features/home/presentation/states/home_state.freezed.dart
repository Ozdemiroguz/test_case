// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState {
  bool get isLoading;
  bool get isLoadingMore; // "load more" işlemi için flag
  List<Movie> get favoriteMovies;
  int get currenIndex;
  bool get longDescription;
  PaginatedMoviesResponse get paginatedMoviesResponse;
  Option<Failure> get failure;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<HomeState> get copyWith =>
      _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            const DeepCollectionEquality()
                .equals(other.favoriteMovies, favoriteMovies) &&
            (identical(other.currenIndex, currenIndex) ||
                other.currenIndex == currenIndex) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription) &&
            (identical(
                    other.paginatedMoviesResponse, paginatedMoviesResponse) ||
                other.paginatedMoviesResponse == paginatedMoviesResponse) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isLoadingMore,
      const DeepCollectionEquality().hash(favoriteMovies),
      currenIndex,
      longDescription,
      paginatedMoviesResponse,
      failure);

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, isLoadingMore: $isLoadingMore, favoriteMovies: $favoriteMovies, currenIndex: $currenIndex, longDescription: $longDescription, paginatedMoviesResponse: $paginatedMoviesResponse, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingMore,
      List<Movie> favoriteMovies,
      int currenIndex,
      bool longDescription,
      PaginatedMoviesResponse paginatedMoviesResponse,
      Option<Failure> failure});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? favoriteMovies = null,
    Object? currenIndex = null,
    Object? longDescription = null,
    Object? paginatedMoviesResponse = null,
    Object? failure = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      favoriteMovies: null == favoriteMovies
          ? _self.favoriteMovies
          : favoriteMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      currenIndex: null == currenIndex
          ? _self.currenIndex
          : currenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      longDescription: null == longDescription
          ? _self.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as bool,
      paginatedMoviesResponse: null == paginatedMoviesResponse
          ? _self.paginatedMoviesResponse
          : paginatedMoviesResponse // ignore: cast_nullable_to_non_nullable
              as PaginatedMoviesResponse,
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _HomeState extends HomeState {
  _HomeState(
      {required this.isLoading,
      required this.isLoadingMore,
      required final List<Movie> favoriteMovies,
      required this.currenIndex,
      required this.longDescription,
      required this.paginatedMoviesResponse,
      required this.failure})
      : _favoriteMovies = favoriteMovies,
        super._();

  @override
  final bool isLoading;
  @override
  final bool isLoadingMore;
// "load more" işlemi için flag
  final List<Movie> _favoriteMovies;
// "load more" işlemi için flag
  @override
  List<Movie> get favoriteMovies {
    if (_favoriteMovies is EqualUnmodifiableListView) return _favoriteMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteMovies);
  }

  @override
  final int currenIndex;
  @override
  final bool longDescription;
  @override
  final PaginatedMoviesResponse paginatedMoviesResponse;
  @override
  final Option<Failure> failure;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            const DeepCollectionEquality()
                .equals(other._favoriteMovies, _favoriteMovies) &&
            (identical(other.currenIndex, currenIndex) ||
                other.currenIndex == currenIndex) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription) &&
            (identical(
                    other.paginatedMoviesResponse, paginatedMoviesResponse) ||
                other.paginatedMoviesResponse == paginatedMoviesResponse) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isLoadingMore,
      const DeepCollectionEquality().hash(_favoriteMovies),
      currenIndex,
      longDescription,
      paginatedMoviesResponse,
      failure);

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, isLoadingMore: $isLoadingMore, favoriteMovies: $favoriteMovies, currenIndex: $currenIndex, longDescription: $longDescription, paginatedMoviesResponse: $paginatedMoviesResponse, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) _then) =
      __$HomeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingMore,
      List<Movie> favoriteMovies,
      int currenIndex,
      bool longDescription,
      PaginatedMoviesResponse paginatedMoviesResponse,
      Option<Failure> failure});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? favoriteMovies = null,
    Object? currenIndex = null,
    Object? longDescription = null,
    Object? paginatedMoviesResponse = null,
    Object? failure = null,
  }) {
    return _then(_HomeState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      favoriteMovies: null == favoriteMovies
          ? _self._favoriteMovies
          : favoriteMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      currenIndex: null == currenIndex
          ? _self.currenIndex
          : currenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      longDescription: null == longDescription
          ? _self.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as bool,
      paginatedMoviesResponse: null == paginatedMoviesResponse
          ? _self.paginatedMoviesResponse
          : paginatedMoviesResponse // ignore: cast_nullable_to_non_nullable
              as PaginatedMoviesResponse,
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

// dart format on
