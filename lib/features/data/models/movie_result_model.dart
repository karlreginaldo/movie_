import 'movie_model.dart';

class MovieResultModel {
  List<MovieModel> movies = [];

  MovieResultModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      json['result'].forEach((v) {
        movies.add(MovieModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (movies != null) {
      data['results'] = movies.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
