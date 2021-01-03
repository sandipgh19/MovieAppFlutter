
import 'package:injectable/injectable.dart';
import 'package:movie_app_flutter/database/moor_db.dart';
import 'package:movie_app_flutter/helpers/network_bound_resource.dart';
import 'package:movie_app_flutter/helpers/resoursce.dart';
import 'package:movie_app_flutter/movie_list/movie_list_local_data_source.dart';
import 'package:movie_app_flutter/movie_list/movie_list_remote_data_source.dart';
import 'package:movie_app_flutter/movie_response.dart';

@injectable
class AppRepository {

  final MovieListRemoteDataSource _remoteDataSource;
  final MovieListLocalDataSource _localDataSource;

  AppRepository(this._localDataSource, this._remoteDataSource);

  Stream<Resource<List<MovieItemData>>> fetchMovieList() {
    return NetworkBoundResources<List<MovieItemData>, MovieItemResponse>()
      .asStream(
        loadFromDb: _localDataSource.allMovieItemsStream,
        shouldFetch: (data) => data == null || data.isEmpty,
        createCall: _remoteDataSource.fetchMovieList,
        processResponse: (result)=>  result?.results?.map<MovieItemData>((e) => e.toTable())?.toList(),
        saveCallResult: (result) => _localDataSource.saveMovieItemList(result.results));
  }

  Stream<MovieItemData> localMovieData(int id) => _localDataSource.getMovieItemStream(id);

}