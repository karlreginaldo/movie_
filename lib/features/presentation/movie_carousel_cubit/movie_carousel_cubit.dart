import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/usecase/no_params.dart';
import 'package:movie_app/features/domain/entities/movie_entity.dart';
import 'package:movie_app/features/domain/usecases/get_trending.dart';

part 'movie_carousel_state.dart';

class MovieCarouselCubit extends Cubit<MovieCarouselState> {
  MovieCarouselCubit(this._getTrending) : super(MovieCarouselInitial());
  final GetTrending _getTrending;
  void getTrending() async {
    final either = await _getTrending(NoParams());

    either.fold((failure) => emit(MovieCarouselError('Error')),
        (movies) => emit(MovieCarouselLoaded(movies)));
  }
}
