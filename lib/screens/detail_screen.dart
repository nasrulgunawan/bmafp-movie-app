import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  const DetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Container(
        child: Text(movie.title),
      ),
    );
  }
}
