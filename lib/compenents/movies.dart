import 'package:flutter/material.dart';
import 'package:movirand/compenents/loading.dart';
import '../api/api.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../colors.dart';
import 'cards_container.dart';

class MovieCard extends StatelessWidget {
  final dynamic data;
  const MovieCard({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double posterWidth = (MediaQuery.of(context).size.width - 25) / 2;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.network(
          'https://image.tmdb.org/t/p/w300' + data['poster_path'],
          width: posterWidth,
        ),
        Container(
          width: posterWidth,
          height: posterWidth * 1.5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black38,
                Colors.black87,
                Colors.black,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(data['title'],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: mainColor,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBarIndicator(
                      rating: double.parse(data['vote_average'].toString()) / 2,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 13,
                    ),
                    Text(data['vote_average'].toString() + '/10',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (FutureBuilder<dynamic>(
      future: api.discover(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
              child: Text('No connexion internet',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) => CardsContainer(data: snapshot.data['results'], index: index),
          );
        } else {
          return const Loading();
        }
      },
    ));
  }
}

