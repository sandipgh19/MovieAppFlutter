import 'package:flutter/material.dart';
import 'package:movie_app_flutter/blocs/movie_bloc.dart';
import 'package:movie_app_flutter/di/di.dart';


class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MovieDetailsWidget();
  }

}

class MovieDetailsWidget extends StatefulWidget {
  MovieDetailsWidget(): super();
  @override
  _MovieDetailsState createState() => _MovieDetailsState();

}

class _MovieDetailsState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    
     final _bloc = getIt.get<MovieBloc>();
     
  }

}