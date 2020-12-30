
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_flutter/data/movie_item_dao.dart';
import 'package:movie_app_flutter/database/moor_db.dart';

@injectable
class MovieListLocalDataSource {

    final MovieItemDao _movieDao;

    MovieListLocalDataSource(this._movieDao);

    Stream<List<MovieItemData>> allMovieItemsStream(){
    return _movieDao.allActiveToDoItemsStream.transform(
        StreamTransformer.fromHandlers(
            handleData: (entries, sink){
              sink.add(entries);
            },
            handleError: (error, stacktrace, sink){
              debugPrint(error);
            }
    ));
  }

  Future<void> saveMovieItemList(List<MovieItemData> items) async {
    return await _movieDao.insertToDoList(items);
  }

}