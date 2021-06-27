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
      body: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 160,
              height: 260,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/profile.jpg'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nasrul Gunawan'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
