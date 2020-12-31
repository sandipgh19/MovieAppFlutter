import 'dart:convert';

import 'package:movie_app_flutter/database/moor_db.dart';

MovieItemResponse movieItemResponseFromJson(String str) => MovieItemResponse.fromJson(json.decode(str));

String movieItemResponseToJson(MovieItemResponse data) => json.encode(data.toJson());

class MovieItemResponse {
    MovieItemResponse({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    factory MovieItemResponse.fromJson(Map<String, dynamic> json) => MovieItemResponse(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
    
}

class Result {
    Result({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    bool adult;
    String backdropPath;
    List<int> genreIds;
    int id;
    String originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String posterPath;
    String releaseDate;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };


    MovieItemData toTable(){
    return MovieItemData(
      adult: adult,
      backdropPath: backdropPath,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  Result fromTable(MovieItemData itemData) {
    return Result(
      adult: itemData.adult,
      backdropPath: itemData.backdropPath,
      id: itemData.id,
      originalLanguage: itemData.originalLanguage,
      originalTitle: itemData.originalTitle,
      overview: itemData.overview,
      popularity: itemData.popularity,
      posterPath: itemData.posterPath,
      releaseDate: itemData.releaseDate,
      title: itemData.title,
      video: itemData.video,
      voteAverage: itemData.voteAverage,
      voteCount: itemData.voteCount
      );
  }
}

