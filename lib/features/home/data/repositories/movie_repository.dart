// repositories/movies_repository_impl.dart
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:test_case/core/injections/locator.dart';
import 'package:test_case/services/network/network_service.dart';
import 'package:test_case/core/models/failure/failure.dart';

import '../../../../constants/api_endpoints.dart';
import '../../domain/models/movie.dart';
import '../../domain/models/paginate_movie_response.dart';
import '../../domain/repositories/movie_repository.dart';

@LazySingleton(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  final NetworkService networkService;

  MoviesRepositoryImpl(this.networkService);

  @override
  Future<Either<Failure, PaginatedMoviesResponse>> getPaginatedMovies(
      {required int page}) async {
    final result = await networkService
        .get(Endpoints.movies, queryParameters: {'page': page});
    return result.fold(
      (failure) => left(failure),
      (response) {
        final responseData = response.data;
        if (responseData != null) {
          try {
            // Gelen JSON şu yapıda:
            // { "response": {...}, "data": { "movies": [...], "pagination": {...} } }
            // Bu yüzden "data" alanını çıkarıyoruz:
            final innerData = responseData['data'];
            if (innerData == null) {
              return left(Failure.unknownError('Data field is missing'));
            }
            final paginatedResponse =
                PaginatedMoviesResponse.fromJson(innerData);
            return right(paginatedResponse);
          } catch (e) {
            return left(
                Failure.unknownError('Failed to parse paginated movies: $e'));
          }
        } else {
          return left(Failure.unknownError('No data received'));
        }
      },
    );
  }

  @override
  Future<Option<Failure>> toggleFavorite(String favoriteId) async {
    // URL: Base toggle favorite endpoint + favoriteId as path parameter.
    final url = Endpoints.favoriteMovie(favoriteId);
    final result = await networkService.post(url);
    return result.fold(
      (failure) => some(failure),
      (_) => none(),
    );
  }

  Future<Either<Failure, List<Movie>>> getFavoriteMovies() async {
    final result = await networkService.get(Endpoints.favorites);
    return result.fold(
      (failure) => left(failure),
      (response) {
        final body = response.data;

        // Burada "movies" yerine "data" alanının varlığını kontrol ediyoruz
        if (body != null && body['data'] != null) {
          try {
            final moviesList = (body['data'] as List)
                .map((movieJson) =>
                    Movie.fromJson(movieJson as Map<String, dynamic>))
                .toList();
            return right(moviesList);
          } catch (e) {
            return left(
                Failure.unknownError('Failed to parse favorite movies'));
          }
        } else {
          return left(Failure.unknownError('No movies data received'));
        }
      },
    );
  }
}
