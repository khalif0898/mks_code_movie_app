import 'package:flutter/material.dart';
import 'package:movie_app/home/data/home_data.dart';
import 'package:movie_app/home/domain/movie.dart';

class ListMoviePage extends StatefulWidget {
  const ListMoviePage({Key? key}) : super(key: key);

  @override
  State<ListMoviePage> createState() => _ListMoviePageState();
}

class _ListMoviePageState extends State<ListMoviePage> {
  late final Movie movie;
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    getDataFromApi();
  }

  Future getDataFromApi() async {
    var result = await HomeData().getMovies();
    setState(() {
      movie = result.last;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoaded ? Text(movie.title) : Text(''),
      ),
    );
  }
}
