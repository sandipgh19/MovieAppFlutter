import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app_flutter/movieItem.dart';

class MovieListItem extends StatelessWidget {
  final List<MovieItem> movieListItem;
  MovieListItem(this.movieListItem);

  Widget _buildMovieItem(BuildContext context, int index) {
    MovieItem movieItem = movieListItem[index];
    return Card(
      child: new Container(
          child: Row(children: [
        Column(
          children: [Text(movieItem.name)],
        ),
        Column(children: [
          Text(movieItem.name),
          Row(children: [
            Text(movieItem.description),
            Text(movieItem.description)
          ]),
          Row(
            children: [
            Text(movieItem.rating),
            Text(getConvertedTime(movieItem.date)),
            Text(movieItem.language)
          ])
        ])
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildMovieItem,
      itemCount: movieListItem.length,
    );
  }

  String getConvertedTime(int timeStamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat("d MMMM y").format(date);
  }
} 
