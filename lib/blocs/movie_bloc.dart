
import 'package:injectable/injectable.dart';
import 'package:movie_app_flutter/database/moor_db.dart';
import 'package:movie_app_flutter/helpers/resoursce.dart';
import 'package:movie_app_flutter/repository/app_repository.dart';

@injectable
class MovieBloc {
  final AppRepository _appRepository;
  // StreamController _movieDataController;
  // bool _isStreaming;

  // StreamSink<Response<MovieItemResponse>> get chuckDataSink =>
  //     _movieDataController.sink;

  // Stream<Response<MovieItemResponse>> get chuckDataStream =>
  //     _movieDataController.stream;

  MovieBloc(this._appRepository);

  Future<void> fetchMovieListCallback() =>
      Future.delayed(Duration.zero, () => _appRepository.fetchMovieList());

  Stream<Resource<List<MovieItemData>>> fetchMovieList() => _appRepository.fetchMovieList();

  Stream<MovieItemData> localMovieData(int id) => _appRepository.localMovieData(id);

}