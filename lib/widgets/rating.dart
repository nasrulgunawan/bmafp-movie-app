import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

class Rating extends StatelessWidget {
  final int rating;
  const Rating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
