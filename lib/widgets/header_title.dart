import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

class HeaderTitle extends StatelessWidget {
  final String name;
  final String subtitle;
  const HeaderTitle({Key? key, required this.name, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello $name,",
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: kBlackColor.withAlpha(160),
            ),
          ),
        ],
      ),
    );
  }
}
