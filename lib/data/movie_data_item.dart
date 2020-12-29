import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

class MovieItem extends Table {

    BoolColumn get adult => boolean()();
    TextColumn get backdropPath => text()();
    // List<int> genreIds;
    IntColumn get id => integer()();
    TextColumn get originalLanguage => text()();
    TextColumn get originalTitle => text()();
    TextColumn get overview => text()();
    RealColumn get popularity => real()();
    TextColumn get posterPath => text()();
    TextColumn get releaseDate => text()();
    TextColumn get title => text()();
    BoolColumn get video => boolean()();
    RealColumn get voteAverage => real()();
    IntColumn get voteCount => integer()();

    @override
    Set<Column> get primaryKey => {id};

    // factory MovieItem.fromJson(Map<String, dynamic> json) => MovieItem(
    //     adult: json["adult"],
    //     backdropPath: json["backdrop_path"],
    //     // genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    //     id: json["id"],
    //     originalLanguage: json["original_language"],
    //     originalTitle: json["original_title"],
    //     overview: json["overview"],
    //     popularity: json["popularity"].toDouble(),
    //     posterPath: json["poster_path"],
    //     releaseDate: json["release_date"],
    //     title: json["title"],
    //     video: json["video"],
    //     voteAverage: json["vote_average"].toDouble(),
    //     voteCount: json["vote_count"],
    // );

    // Map<String, dynamic> toJson() => {
    //     "adult": adult,
    //     "backdrop_path": backdropPath,
    //     // "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    //     "id": id,
    //     "original_language": originalLanguage,
    //     "original_title": originalTitle,
    //     "overview": overview,
    //     "popularity": popularity,
    //     "poster_path": posterPath,
    //     "release_date": releaseDate,
    //     "title": title,
    //     "video": video,
    //     "vote_average": voteAverage,
    //     "vote_count": voteCount,
    // };
}

@UseMoor(tables: [MovieItem])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "movie_db.sqlite", logStatements: true));
  int get schemaVersion => 1;
  // int get schemaVersion => 1;
  // Future<List<MovieItem>> getAllOrder() => select(orders).get();
  // Stream<List<MovieItem>> watchAllOrder() => select(orders).watch();
  // Future insertNewOrder(MovieItem order) => into(orders).insert(order);
  // Future deleteOrder(MovieItem order) => delete(orders).delete(order);
}