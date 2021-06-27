class Movie {
  int id;
  String title;
  String overview;
  String posterPath;
  String backdropPath;
  double voteRate;
  String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteRate,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> parsedJson) => Movie(
        id: parsedJson['id'],
        title: parsedJson['title'] ?? '-',
        overview: parsedJson['overview'] ?? '-',
        posterPath: parsedJson['poster_path'] ?? '',
        backdropPath: parsedJson['backdrop_path'] ?? '',
        voteRate: parsedJson['vote_average']?.toDouble() ?? 0,
        releaseDate: parsedJson['release_date']?.toString() ?? '',
      );
}
