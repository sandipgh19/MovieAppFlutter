import 'package:movie_app_flutter/movieItem.dart';
import 'package:movie_app_flutter/networking/Repsonse.dart';
import 'package:movie_app_flutter/networking/api_provider.dart';

class AppRepository {

var apiKey = "153625bb97b19df233040bf26f3399ab";

  Stream<Resource<List<MovieItem>>> fetchMovieList() {
    return NetworkBoundResources<List<MovieItem>,List<MovieItem>>()
      .asStream(
        loadFromDb: _dao.allActiveToDoItemsStream,
        shouldFetch: (data) => data == null || data.isEmpty,
        createCall: _remoteDataSource.getToDoItemsFromApi(),
        processResponse: (request) => request.toResult(),
        saveCallResult: (result) => _dao.insertToDo(result);
  }

}