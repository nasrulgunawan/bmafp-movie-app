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
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 24),
                    child: CircleAvatar(
                      backgroundColor: kBlackColor,
                      child: Text('NG'),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nasrul Gunawan',
                          style: TextStyle(
                              color: kBlackColor,
                              fontSize: 18,
                              fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Dicoding User',
                          style: TextStyle(color: kBlackColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Submission',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Kelas Belajar Membuat Aplikasi Flutter untuk Pemula",
                style: TextStyle(color: kBlackColor),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'UI Inspiration',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "https://dribbble.com/shots/14881170-Cinema-Ticket-App",
                style: TextStyle(color: kBlackColor),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 90),
                  child: Text(
                    'Movee v1.0.0',
                    style: blackTextStyle,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
