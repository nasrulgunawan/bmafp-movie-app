import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

class Rating extends StatelessWidget {
  final double rating;
  final MainAxisAlignment alignment;
  const Rating({Key? key, required this.rating, required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _rating = rating / 2;
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Icon(
          Icons.star,
          color: _rating >= 1 ? kYellowColor : kGreyColor,
          size: 16,
        ),
        Icon(
          Icons.star,
          color: _rating >= 2 ? kYellowColor : kGreyColor,
          size: 16,
        ),
        Icon(
          Icons.star,
          color: _rating >= 3 ? kYellowColor : kGreyColor,
          size: 16,
        ),
        Icon(
          Icons.star,
          color: _rating >= 4 ? kYellowColor : kGreyColor,
          size: 16,
        ),
        Icon(
          Icons.star,
          color: _rating >= 5 ? kYellowColor : kGreyColor,
          size: 16,
        ),
      ],
    );
  }
}
