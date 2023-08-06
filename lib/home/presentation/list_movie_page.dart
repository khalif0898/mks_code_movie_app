import 'package:flutter/material.dart';
import 'package:movie_app/home/data/home_data.dart';
import 'package:movie_app/home/domain/movie.dart';
import 'package:movie_app/home/presentation/detail_page.dart';

class ListMoviePage extends StatefulWidget {
  const ListMoviePage({Key? key}) : super(key: key);

  @override
  State<ListMoviePage> createState() => _ListMoviePageState();
}

class _ListMoviePageState extends State<ListMoviePage> {
  late final Movie movie;
  late final List<Movie> movies;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getDataFromApi();
  }

  Future getDataFromApi() async {
    var result = await HomeData().getMovies();
    setState(() {
      movies = result;
      movie = result.last;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailPage(movie: movies[index]),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Row(children: [
                    Text(movies[index].title),
                    SizedBox(
                      width: 8,
                    ),
                    Text(movies[index].year.toString()),
                  ]),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
