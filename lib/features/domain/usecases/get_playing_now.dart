import 'package:movie_app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/no_params.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/domain/entities/movie_entity.dart';
import 'package:movie_app/features/domain/repositories/movie_repository.dart';

class GetPlayingNow extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetPlayingNow(this.movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return await movieRepository.getPlayingNow();
  }
}
