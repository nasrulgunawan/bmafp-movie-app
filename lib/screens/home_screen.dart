import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/carousel.dart';
import 'package:movie_app/widgets/header.dart';
import 'package:movie_app/widgets/header_title.dart';
import 'package:movie_app/widgets/movie_list.dart';

Future<String> _loadMovieAsset() async {
  return await rootBundle.loadString('assets/popular_movies.json');
}

Future<List<Movie>> getMovies() async {
  // await wait(3);
  String jsonString = await _loadMovieAsset();
  List jsonResponse = json.decode(jsonString);
  return jsonResponse.map((m) => Movie.fromJson(m)).toList();
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Header(),
          HeaderTitle(
            name: 'Nasrul',
            subtitle: 'Book your favorite movie',
          ),
          Carousel(),
          MovieList(),
        ],
      ),
    );
  }
}
