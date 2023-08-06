import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/home/domain/movie.dart';

class HomeData {
  Future<List<Movie>> getMovies() async {
    var response = await http.get(
      Uri.parse('https://moviesdatabase.p.rapidapi.com/titles'),
      headers: {
        'X-RapidAPI-Key': 'eec33f3571mshe4aa4f79494e692p1527f6jsnb5c8c4c202d1',
        'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com'
      },
    );
    // problem: parsing list data to object
    var json = jsonDecode(response.body)['results'];
    List<Movie> result = [];
    result = json.map<Movie>((e) => Movie.fromJson(e)).toList();

    return result;
  }
}
