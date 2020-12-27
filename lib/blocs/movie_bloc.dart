import 'dart:async';

import 'package:movie_app_flutter/movieItem.dart';
import 'package:movie_app_flutter/networking/Repsonse.dart';
import 'package:movie_app_flutter/repository/AppRepository.dart';

class MovieBloc {
  ChuckRepository _appRepository;
  StreamController _movieDataController;
  bool _isStreaming;

  StreamSink<Response<MovieItemResponse>> get chuckDataSink =>
      _movieDataController.sink;

  Stream<Response<MovieItemResponse>> get chuckDataStream =>
      _movieDataController.stream;

  MovieBloc() {
    _movieDataController = StreamController<Response<MovieItemResponse>>();
    _appRepository = ChuckRepository();
    _isStreaming = true;
    fetchMovieItemList();
  }

  fetchMovieItemList() async {
    chuckDataSink.add(Response.loading('Getting a Chucky joke!'));
    try {
      MovieItemResponse chuckJoke = await _appRepository.fetchMovieList();
      if (_isStreaming) chuckDataSink.add(Response.success(chuckJoke));
    } catch (e) {
      if (_isStreaming) chuckDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _isStreaming = false;
    _movieDataController?.close();
  }
}