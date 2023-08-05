import 'package:flutter/material.dart';
import 'package:movie_app/home/presentation/list_movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListMoviePage(),
    );
  }
}
