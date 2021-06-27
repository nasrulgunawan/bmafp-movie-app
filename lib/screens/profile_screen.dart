import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: blackTextStyle,
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: Row(
        children: [
          Container(
            width: 100,
            height: 160,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
