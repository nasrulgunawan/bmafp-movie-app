import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/carousel.dart';
import 'package:movie_app/widgets/header.dart';
import 'package:movie_app/widgets/header_title.dart';
import 'package:movie_app/widgets/movie_list.dart';
import 'package:movie_app/widgets/custom_title.dart';

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
          SizedBox(
            height: 10,
          ),
          CustomTitle(text: 'Popular'),
          MovieList(),
        ],
      ),
    );
  }
}
