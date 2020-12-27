import 'package:movie_app_flutter/movieItem.dart';
import 'package:movie_app_flutter/networking/ApiProvider.dart';

class ChuckRepository {
  ApiProvider _provider = ApiProvider();

var apiKey = "153625bb97b19df233040bf26f3399ab";

  Future<MovieItemResponse> fetchMovieList() async {
    final response = await _provider.get("discover/movie?api_key="+apiKey);
    return MovieItemResponse.fromJson(response);
  }

}