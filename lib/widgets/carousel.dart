import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/detail_screen.dart';
import 'package:movie_app/widgets/movie_card.dart';

Future<String> _loadMovieAsset() async {
  return await rootBundle.loadString('assets/popular_movies.json');
}

Future<List<Movie>> getMovies() async {
  // await wait(3);
  String jsonString = await _loadMovieAsset();
  List jsonResponse = json.decode(jsonString);
  return jsonResponse.map((m) => Movie.fromJson(m)).toList();
}

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder<List<Movie>>(
        future: getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Movie> movies = snapshot.data ?? [];
            return Container(
              margin: EdgeInsets.only(top: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: movies
                      .map(
                        (movie) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(movie: movie),
                                ),
                              );
                            },
                            child: MovieCard(
                              title: movie.title,
                              genre: 'Action',
                              imageUrl:
                                  '${dotenv.env['BASE_IMAGE_URL']}${movie.posterPath}',
                              rating: 5,
                            )),
                      )
                      .toList(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Column(
            children: [CircularProgressIndicator()],
          );
        },
      );
}
