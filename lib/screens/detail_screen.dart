import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/rating.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  const DetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kBlackColor),
        leading: IconButton(
          icon: Icon(EvaIcons.arrowIosBackOutline),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(movie.title, style: TextStyle(color: kBlackColor)),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kBackgroundColor,
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 260,
                height: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${dotenv.env['BASE_IMAGE_URL']}${movie.posterPath}',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Rating(
                rating: movie.voteRate,
                alignment: MainAxisAlignment.center,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style:
                        blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    movie.overview,
                    style: blackTextStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
