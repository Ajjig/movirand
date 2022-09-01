import 'package:flutter/material.dart';
import '../api/api.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MovieCard extends StatelessWidget {
  final dynamic data;
  const MovieCard({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Container(
          color: const Color(0xFF011627),
          child: const Center(
              child: CircularProgressIndicator(color: Color(0xFFFF2745))));
    }
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.network(
                  'https://image.tmdb.org/t/p/w300' + data['poster_path'],
                   width: (MediaQuery.of(context).size.width - 10 - 10 * 4) / 2,

                  ),
            Container(
              width: (MediaQuery.of(context).size.width - 10 - 10 * 4) / 2,
              height: (MediaQuery.of(context).size.height - 10 - 10 * 4) / 2 * .6555,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black12,
                    Colors.black38,
                    Colors.black87,
                    Colors.black,
                  ],
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height - 10 - 10 * 4) / 2 * .6555,
              width: (MediaQuery.of(context).size.width - 10 - 10 * 4) / 2,
              child: Column(
                children: [
                  const SizedBox(height: 205),

                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Text(data['title'], overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),

                  const Divider(
                    indent: 15,
                    endIndent: 15,
                    color: Color(0xFFFF2745),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
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
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
          return const Center(child: Text('No connexion internet', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) =>
              Row(
                children: [
                  MovieCard(data: snapshot.data['results'][index]),
                  const SizedBox(width: 10),
                  MovieCard(data: snapshot.data['results'][index + 10]),
                ],
              ),
          );
        } else {
          return const MovieCard(data: null);
        }
      },
    ));
  }
}
