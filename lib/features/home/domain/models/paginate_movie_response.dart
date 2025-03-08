import 'package:test_case/features/home/domain/models/movie.dart';

class PaginatedMoviesResponse {
  final List<Movie> movies;
  final int totalPages;
  final int currentPage;

  PaginatedMoviesResponse({
    required this.movies,
    required this.totalPages,
    required this.currentPage,
  });

  factory PaginatedMoviesResponse.fromJson(Map<String, dynamic> json) {
    // "movies" alanı null ise, boş bir liste olarak kabul edelim.
    final moviesJson = json['movies'] as List<dynamic>? ?? [];
    final movies = moviesJson
        .map((e) => Movie.fromJson(e as Map<String, dynamic>))
        .toList();

    // "pagination" alanını da kontrol edelim, null ise varsayılan değerler kullanalım.
    final pagination = json['pagination'] as Map<String, dynamic>? ?? {};
    final totalPages = pagination['maxPage'] as int? ?? 0;
    final currentPage = pagination['currentPage'] as int? ?? 0;

    return PaginatedMoviesResponse(
      movies: movies,
      totalPages: totalPages,
      currentPage: currentPage,
    );
  }

  //copy with method
  PaginatedMoviesResponse copyWith({
    List<Movie>? movies,
    int? totalPages,
    int? currentPage,
  }) {
    return PaginatedMoviesResponse(
      movies: movies ?? this.movies,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
