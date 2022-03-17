import 'package:movie_app/core/api_client.dart';
import 'package:movie_app/features/data/models/movie_model.dart';
import 'package:movie_app/features/data/models/movie_result_model.dart';

abstract class MovieRemoteDateSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDateSource {
  final ApiClient _apiClient;

  MovieRemoteDataSourceImpl(this._apiClient);
  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = _apiClient.get("trending/movie/day");
    final movies = MovieResultModel.fromJson(response.body).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = _apiClient.get("movie/now_playing");
    final movies = MovieResultModel.fromJson(response.body).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = _apiClient.get("movie_popular");
    final movies = MovieResultModel.fromJson(response.body).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = _apiClient.get("movie/upcoming");
    final movies = MovieResultModel.fromJson(response.body).movies;
    return movies;
  }
}
