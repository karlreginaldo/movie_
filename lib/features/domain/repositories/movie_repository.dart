import 'package:movie_app/core/failure/failure.dart';
import 'package:movie_app/features/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getTrending();
  Future<Either<Failure, List<MovieEntity>>> getPopular();
  Future<Either<Failure, List<MovieEntity>>> getPlayingNow();
  Future<Either<Failure, List<MovieEntity>>> getComingSoon();
}
