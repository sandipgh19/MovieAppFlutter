import 'package:flutter/material.dart';
import 'package:movie_app_flutter/blocs/movie_bloc.dart';
import 'package:movie_app_flutter/data/constant.dart';
import 'package:movie_app_flutter/di/di.dart';
import 'package:movie_app_flutter/database/moor_db.dart';

class MovieDetails extends StatelessWidget {
  final int movieID;
  MovieDetails(this.movieID);

  @override
  Widget build(BuildContext context) {
    return MovieDetailsWidget(movieID);
  }
}

class MovieDetailsWidget extends StatefulWidget {
  final int movieID;
  MovieDetailsWidget(this.movieID) : super();
  @override
  _MovieDetailsState createState() => _MovieDetailsState(movieID);
}

class _MovieDetailsState extends State<MovieDetailsWidget> {
  final int movieID;

  _MovieDetailsState(this.movieID);

  @override
  Widget build(BuildContext context) {
    final _bloc = getIt.get<MovieBloc>();
    return StreamBuilder<MovieItemData>(
        stream: _bloc.localMovieData(movieID),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.data != null)
            return new MovieDetailsView(movieItemData: snapshot.data);
          else
            return Container();
        });
  }
}

class MovieDetailsView extends StatelessWidget {
  final MovieItemData movieItemData;

  const MovieDetailsView({Key key, this.movieItemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movieItemData?.title ?? "Error"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      Constant.imageBaseURL + movieItemData.backdropPath),
                ),
              ),
            ),
            new Container(
                margin: EdgeInsets.all(10),
                child: Text(movieItemData?.overview,
                    style: TextStyle(color: Colors.black54, fontSize: 16))),

            Row(children: [
                        Expanded(child: Text(movieItemData?.originalTitle), flex: 2),
                        Expanded(child: Text(Constant().convertionTime(movieItemData?.releaseDate)), flex: 2),
                        Expanded(child: Text(movieItemData?.popularity?.toString()), flex: 6)

                      ],),

                       Row(children: [
                        Expanded(child: Text(movieItemData?.releaseDate), flex: 8),
                        Expanded(child: Text(movieItemData?.originalLanguage), flex: 2)

                      ],)
                    
              
          ],
        )));
  }
}
