part of 'movie_carousel_cubit.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {
  const MovieCarouselInitial();
}

class MovieCarouselLoading extends MovieCarouselState {
  const MovieCarouselLoading();
}

class MovieCarouselError extends MovieCarouselState {
  const MovieCarouselError(this.errormsg);
  final String errormsg;
  @override
  List<Object> get props => [errormsg];
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({required this.movies, this.defaultIndex = 0});

  @override
  List<Object> get props => [movies, defaultIndex];
}
