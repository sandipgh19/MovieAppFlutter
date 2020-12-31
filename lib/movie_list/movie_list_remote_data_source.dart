import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:movie_app_flutter/data/constant.dart';
import 'package:movie_app_flutter/movie_response.dart';
import 'package:http/http.dart' as http;

@injectable
class MovieListRemoteDataSource {

    static const String apiKey = "153625bb97b19df233040bf26f3399ab";

   Future<MovieItemResponse> fetchMovieList() async {
     final response = await http.get(Constant.baseURL+"discover/movie?api_key="+apiKey);
     print(response);
     return MovieItemResponse.fromJson(json.decode(response.body));
   }
}