
import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:movie_app_flutter/data/movie_item_dao.dart';
import 'package:movie_app_flutter/database/moor_db.dart';
import 'package:movie_app_flutter/movie_response.dart';

@injectable
class MovieListLocalDataSource {

  final MovieItemDao _movieDao;

  MovieListLocalDataSource(this._movieDao);

  Stream<List<MovieItemData>> allMovieItemsStream() =>  _movieDao.allActiveToDoItemsStream;

  Stream<MovieItemData> getMovieItemStream(int id) {
    return  _movieDao.movieItemsStream(id);
  }


  Future<void> saveMovieItemList(List<Result> items) async {
    return await _movieDao.insertToDoList(items.map<MovieItemData>((e) => e.toTable()).toList());
  }

}