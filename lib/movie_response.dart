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
    List<MovieItemData> results;
    int totalPages;
    int totalResults;

    factory MovieItemResponse.fromJson(Map<String, dynamic> json) => MovieItemResponse(
        page: json["page"],
        results: List<MovieItemData>.from(json["results"].map((x) => MovieItemData.fromJson(x))),
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

