part of 'movie_carousel_cubit.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselLoading extends MovieCarouselState {}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;
  MovieCarouselLoaded(
    this.movies, {
    this.defaultIndex = 0,
  });
}

class MovieCarouselError extends MovieCarouselState {
  final String message;

  MovieCarouselError(this.message);
}
