import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/domain/entities/movie_entity.dart';
import 'package:movie_app/features/domain/usecases/get_trending.dart';

import '../../../core/usecase/no_params.dart';

part 'movie_carousel_state.dart';

class MovieCarouselCubit extends Cubit<MovieCarouselState> {
  MovieCarouselCubit(this._getTrending) : super(const MovieCarouselInitial());

  final GetTrending _getTrending;
  void getTrending() async {
    emit(const MovieCarouselLoading());
    final moviesEither = await _getTrending(NoParams());
    moviesEither.fold((l) => const MovieCarouselError("error"),
        (movies) => MovieCarouselLoaded(movies: movies));
  }
}
