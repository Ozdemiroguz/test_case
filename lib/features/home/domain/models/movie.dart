class Movie {
  final String id;
  final String title;
  final String description;
  final String posterUrl;
  final bool isFavorite;
  final String director; // Yeni eklenen alan

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.director, // Constructor'a ekledik
    this.isFavorite = false,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: (json['id'] ?? json['_id'])?.toString() ?? '',
      title: (json['Title'] as String?) ?? '',
      description: (json['Plot'] as String?) ?? '',
      posterUrl: (json['Poster'] as String?) ?? '',
      director: (json['Director'] as String?) ??
          '', // Yönetmen bilgisi buraya eklendi
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }

  Movie copyWith({
    String? id,
    String? title,
    String? description,
    String? posterUrl,
    String? director, // CopyWith için de ekledik
    bool? isFavorite,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      posterUrl: posterUrl ?? this.posterUrl,
      director: director ?? this.director, // Yeni alanı buraya ekledik
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
