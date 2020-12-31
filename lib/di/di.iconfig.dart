// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:movie_app_flutter/database/moor_db.dart';
import 'package:movie_app_flutter/data/movie_item_dao.dart';
import 'package:movie_app_flutter/movie_list/movie_list_local_data_source.dart';
import 'package:movie_app_flutter/movie_list/movie_list_remote_data_source.dart';
import 'package:movie_app_flutter/repository/app_repository.dart';
import 'package:movie_app_flutter/blocs/movie_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerFactory<MovieItemDao>(() => MovieItemDao(g<MoorDB>()));
  g.registerFactory<MovieListLocalDataSource>(
      () => MovieListLocalDataSource(g<MovieItemDao>()));
  g.registerFactory<MovieListRemoteDataSource>(
      () => MovieListRemoteDataSource());
  g.registerFactory<AppRepository>(() => AppRepository(
      g<MovieListLocalDataSource>(), g<MovieListRemoteDataSource>()));
  g.registerFactory<MovieBloc>(() => MovieBloc(g<AppRepository>()));

  //Eager singletons must be registered in the right order
  g.registerSingleton<MoorDB>(MoorDB());
}
