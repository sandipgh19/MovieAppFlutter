import 'package:moor_flutter/moor_flutter.dart';

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
}