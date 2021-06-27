import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/header.dart';
import 'package:movie_app/widgets/movie_list.dart';
import 'package:movie_app/widgets/custom_title.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: blackTextStyle,
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          MovieList(),
        ],
      ),
    );
  }
}
