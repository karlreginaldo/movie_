import 'package:movie_app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/features/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/features/data/models/movie_model.dart';
import 'package:movie_app/features/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDateSource remoteDateSource;

  MovieRepositoryImpl(this.remoteDateSource);

  @override
  Future<Either<Failure, List<MovieModel>>> getComingSoon() async {
    try {
      final movies = await remoteDateSource.getComingSoon();
      return Right(movies);
    } on Exception {
      return Left(Failure("error"));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPlayingNow() async {
    try {
      final movies = await remoteDateSource.getPlayingNow();
      return Right(movies);
    } on Exception {
      return Left(Failure("error"));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopular() async {
    try {
      final movies = await remoteDateSource.getPopular();
      return Right(movies);
    } on Exception {
      return Left(Failure("error"));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDateSource.getTrending();
      return Right(movies);
    } on Exception {
      return Left(Failure("error"));
    }
  }
}
