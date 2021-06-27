import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/detail_screen.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/movie_card.dart';
import 'package:movie_app/widgets/movie_tile.dart';

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
    Widget movieList() {
      return FutureBuilder<List<Movie>>(
        future: getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Movie> movies = snapshot.data ?? [];
            return ListView(
              physics:
                  NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true,
              children: movies
                  .map(
                    (movie) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(movie: movie),
                            ),
                          );
                        },
                        child: MovieCard(
                          title: 'The Secret',
                          genre: 'Action',
                          imageUrl:
                              '${dotenv.env['BASE_IMAGE_URL']}${movie.posterPath}',
                          rating: 5,
                        )),
                  )
                  .toList(),
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

    Widget buildTitle() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Movee',
                  style: blackTextStyle.copyWith(
                    fontSize: 28,
                    fontWeight: black,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget buildCarousel() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: movieList(),
        ),
      );
    }

    Widget buildList() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: black,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MovieTile(
              title: 'Nussa & Rara',
              genre: 'Animation',
              imageUrl: '',
              rating: 3,
            ),
            MovieTile(
              title: 'A quite place',
              genre: 'Triller',
              imageUrl: '',
              rating: 5,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          buildTitle(),
          buildCarousel(),
          buildList(),
        ],
      ),
    );
  }
}
