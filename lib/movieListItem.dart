import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app_flutter/data/constant.dart';
import 'package:movie_app_flutter/database/moor_db.dart';
import 'package:movie_app_flutter/ui/movie_details.dart';


class MovieListItem extends StatelessWidget {
  final List<MovieItemData> movieListItem;
  MovieListItem(this.movieListItem);

  Widget _buildMovieItem(BuildContext context, int index) {
    MovieItemData movieItem = movieListItem[index];
    return Card(
      child: new InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetails(movieItem.id)));
      },
      child: new Container(
          constraints: BoxConstraints(minHeight: 100),
          padding: EdgeInsets.only(left: 4.0),
          child: Row(children: [
            Expanded(flex: 3, child: new Image.network(Constant.imageBaseURL+movieItem.posterPath, fit: BoxFit.fill)),
            Expanded(
                flex: 7,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Padding(padding: const EdgeInsets.fromLTRB(8.0, 0.0, 4.0, 4.0), child: Text(movieItem.title)),
                     Padding(padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 4.0), child: 
                      Row(children: [
                        Expanded(child: Text(movieItem.overview, overflow: TextOverflow.ellipsis, maxLines: 6), flex: 8),
                        Expanded(child: Icon(Icons.navigate_next), flex: 2)
                      ],)),
                      Padding(padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 4.0), child:
                      Row(children: [
                        Expanded(child: Text(movieItem.voteAverage.toString()), flex: 2),
                        Expanded(
                            child: Text(getConvertedTime(movieItem.releaseDate)),
                            flex: 6),
                        Expanded(child: Text(movieItem.originalLanguage), flex: 2)
                      ]))
                    ]))
          ])),
    )
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
