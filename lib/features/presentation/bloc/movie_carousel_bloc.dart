import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/usecase/no_params.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/usecases/get_trending.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  MovieCarouselBloc({required this.getTrending})
      : super(MovieCarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) async {
      if (event is CarouselLoadEvent) {
        final moviesEither = await getTrending(NoParams());
        moviesEither.fold(
            (l) => emit(const MovieCarouselError()),
            (movies) => emit(
                  MovieCarouselLoaded(
                      movies: movies, defaultIndex: event.defaultIndex),
                ));
      }
    });
  }
}
