// repositories/movies_repository.dart
import 'package:fpdart/fpdart.dart';
import '../../../../core/models/failure/failure.dart';
import '../models/movie.dart';
import '../models/paginate_movie_response.dart';

abstract class MoviesRepository {
  /// Gets the paginated list of all movies.
  Future<Either<Failure, PaginatedMoviesResponse>> getPaginatedMovies(
      {required int page});

  /// Toggles the favorite status of a movie identified by [favoriteId].
  /// Returns true if the toggle operation was successful.
  Future<Option<Failure>> toggleFavorite(String favoriteId);

  /// Gets the list of user's favorite movies.
  Future<Either<Failure, List<Movie>>> getFavoriteMovies();
}
