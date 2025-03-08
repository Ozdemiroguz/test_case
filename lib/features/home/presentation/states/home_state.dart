import 'package:fpdart/fpdart.dart';
import 'package:test_case/core/models/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/movie.dart';
import '../../domain/models/paginate_movie_response.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    required bool isLoading,
    required bool isLoadingMore, // "load more" işlemi için flag
    required List<Movie> favoriteMovies,
    required int currenIndex,
    required bool longDescription,
    required PaginatedMoviesResponse paginatedMoviesResponse,
    required Option<Failure> failure,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        isLoading: false,
        isLoadingMore: false,
        currenIndex: 0,
        favoriteMovies: [],
        longDescription: false,
        paginatedMoviesResponse: PaginatedMoviesResponse(
          currentPage: 0,
          totalPages: 0,
          movies: [],
        ),
        failure: none(),
      );

  const HomeState._();
}
