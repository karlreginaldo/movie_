import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final String overview;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.overview,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title];
}
