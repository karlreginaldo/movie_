import 'package:movie_app/features/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final bool adult;
  final String backdropPath;
  final int voteCount;
  final List<int> genreIds;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String posterPath;
  final int id;
  final bool video;
  final double popularity;
  final String mediaType;
  const MovieModel({
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.adult,
    required this.backdropPath,
    required this.voteCount,
    required this.genreIds,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.posterPath,
    required this.id,
    required this.video,
    required this.popularity,
    required this.mediaType,
  }) : super(
          id: id,
          title: title,
          overview: overview,
          backdropPath: backdropPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          posterPath: posterPath,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      voteAverage: json['vote_average']?.toDouble(),
      overview: json['overview'],
      releaseDate: json['release_date'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      voteCount: json['vote_count'],
      genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      title: json['title'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      id: json['id'],
      video: json['video'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "vote_average": voteAverage,
      "overview": overview,
      "release_date": releaseDate,
      "adult": adult,
      "backdrop_path": backdropPath,
      "vote_count": voteCount,
      "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
      "title": title,
      "original_language": originalLanguage,
      "poster_path": posterPath,
      "id": id,
      "video": video,
      "popularity": popularity,
      "media_type": mediaType,
    };
  }
}
