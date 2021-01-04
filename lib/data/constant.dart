import 'package:intl/intl.dart';

class Constant {

  static const baseURL = 'https://api.themoviedb.org/3/';
  static const imageBaseURL = "https://image.tmdb.org/t/p/w500";

  String convertionTime(String timeStamp) {
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