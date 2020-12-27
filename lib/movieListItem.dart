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
          constraints: BoxConstraints(minHeight: 100),
          padding: EdgeInsets.only(left: 8.0),
          child: Row(children: [
            Expanded(flex: 3, child: new Image.network("https://image.tmdb.org/t/p/w500"+movieItem.posterPath, fit: BoxFit.fill)),
            Expanded(
                flex: 7,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Padding(padding: const EdgeInsets.all(8.0), child: Text(movieItem.title)),
                     Padding(padding: const EdgeInsets.all(8.0), child: 
                      Row(children: [
                        Expanded(child: Text(movieItem.overview, overflow: TextOverflow.ellipsis, maxLines: 6), flex: 8),
                        Expanded(child: Icon(Icons.navigate_next), flex: 2)
                      ],)),
                      Padding(padding: const EdgeInsets.all(8.0), child:
                      Row(children: [
                        Expanded(child: Text(movieItem.voteAverage.toString()), flex: 2),
                        Expanded(
                            child: Text(getConvertedTime(movieItem.releaseDate)),
                            flex: 6),
                        Expanded(child: Text(movieItem.originalLanguage), flex: 2)
                      ]))
                    ]))
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

  String getConvertedTime(String timeStamp) {
    try {
      DateFormat format = DateFormat("y-MM-d");
      DateTime date = format.parse(timeStamp);
      String suffix = getDayNumberSuffix(date.day);
      return DateFormat("d'$suffix' MMMM y").format(date);
    }catch(e) {
      return timeStamp;
    }
    
  }

  String getDayNumberSuffix(int day) {
    if(day>= 11 && day <=13) {
      return "th";
    }

    switch(day%10) {
      case 1: 
      return "st";
      break;
      case 2: 
      return "nd";
      break;
      case 3:
      return "rd";
      default:
      return "th";
    }

  }
}
