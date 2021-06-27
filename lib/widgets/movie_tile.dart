import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/rating.dart';

class MovieTile extends StatelessWidget {
  final String title;
  final String genre;
  final String imageUrl;
  final double rating;

  const MovieTile({
    Key? key,
    this.title = '',
    this.genre = '',
    this.imageUrl = '',
    this.rating = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 160,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Rating(
                    rating: rating,
                    alignment: MainAxisAlignment.start,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    genre,
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
