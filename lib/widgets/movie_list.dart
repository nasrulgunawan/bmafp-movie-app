import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/detail_screen.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/movie_tile.dart';

Future<String> _loadMovieAsset() async {
  return await rootBundle.loadString('assets/now_playing_movies.json');
}

Future<List<Movie>> getMovies() async {
  
  String jsonString = await _loadMovieAsset();
  List jsonResponse = json.decode(jsonString);
  return jsonResponse.map((m) => Movie.fromJson(m)).toList();
}

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder<List<Movie>>(
        future: getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Movie> movies = snapshot.data ?? [];
            return Container(
              margin: EdgeInsets.only(
                top: 10,
                left: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: movies
                    .map(
                      (movie) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(movie: movie),
                              ),
                            );
                          },
                          child: MovieTile(
                            title: movie.title,
                            genre: 'Action',
                            imageUrl:
                                '${dotenv.env['BASE_IMAGE_URL']}${movie.posterPath}',
                            rating: movie.voteRate,
                          )),
                    )
                    .toList(),
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
