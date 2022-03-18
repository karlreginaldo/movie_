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
    final trendingMap = await _apiClient.get("trending/movie/day");
    return MovieResultModel.fromJson(trendingMap).movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final playingnowMap = await _apiClient.get("movie/now_playing");
    return MovieResultModel.fromJson(playingnowMap).movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final popularMap = await _apiClient.get("movie_popular");
    return MovieResultModel.fromJson(popularMap).movies;
  }

  @override
  Future<List<MovieModel>> getTrending() async {
    final upcomingMap = await _apiClient.get("movie/upcoming");
    return MovieResultModel.fromJson(upcomingMap).movies;
  }
}
