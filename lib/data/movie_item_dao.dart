import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';
import 'package:movie_app_flutter/data/movie_data_item.dart';
import 'package:movie_app_flutter/database/moor_db.dart';
part 'movie_item_dao.g.dart';

@injectable
@UseDao(tables: [MovieItem])
class MovieItemDao extends DatabaseAccessor<MoorDB> with _$MovieItemDaoMixin {
  MovieItemDao(MoorDB db) : super(db);

  Stream<List<MovieItemData>> get allActiveToDoItemsStream =>
      select(movieItem).watch();

  Future<void> insertToDoList(List<MovieItemData> entries) async {
    return await batch((batch) =>
        batch.insertAll(movieItem, entries, mode: InsertMode.insertOrReplace));
  }

  Future<MovieItemData> movieItemsStream(int id) async =>
      (select(movieItem)..where((g) => g.id.equals(id))).watchSingle().last;
}