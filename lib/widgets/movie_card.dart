import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String genre;
  final String imageUrl;
  final int rating;

  const MovieCard({
    Key? key,
    this.title = '',
    this.genre = '',
    this.imageUrl = '',
    this.rating = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(
        left: defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              ),
              borderRadius: BorderRadius.circular(21),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: rating >= 1 ? kYellowColor : kGreyColor,
              ),
              Icon(
                Icons.star,
                color: rating >= 2 ? kYellowColor : kGreyColor,
              ),
              Icon(
                Icons.star,
                color: rating >= 3 ? kYellowColor : kGreyColor,
              ),
              Icon(
                Icons.star,
                color: rating >= 4 ? kYellowColor : kGreyColor,
              ),
              Icon(
                Icons.star,
                color: rating >= 5 ? kYellowColor : kGreyColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
