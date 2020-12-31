import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:movie_app_flutter/data/movie_item_dao.dart';
import 'package:movie_app_flutter/data/movie_data_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as p;

part 'moor_db.g.dart';

LazyDatabase _init() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path,
        "movie_list_db.sqlite"));
    return VmDatabase(file);
  });
}

@singleton
@UseMoor(tables: [MovieItem], daos: [MovieItemDao])
class MoorDB extends _$MoorDB {
  MoorDB() : super(_init());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
      onCreate: (m) {
        return m.createAll();
      },
      onUpgrade: (m, from, to) async {});

  Future<void> resetDb() async {
    for (var table in allTables) {
      await delete(table).go();
    }
  }
}