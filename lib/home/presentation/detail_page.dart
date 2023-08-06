import 'package:flutter/material.dart';
import 'package:movie_app/home/domain/movie.dart';

class DetailPage extends StatelessWidget {
  Movie movie;
  DetailPage({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.network(movie.posterUrl),
              ),
              SizedBox(height: 24),
              Text(
                'Title : ${movie.title}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              SizedBox(height: 12),
              Text('Year : ${movie.year}'),
              SizedBox(height: 12),
              Text('Caption : ${movie.caption}'),
            ],
          ),
        ),
      ),
    );
  }
}
