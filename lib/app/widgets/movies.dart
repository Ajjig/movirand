import 'package:flutter/material.dart';
import 'package:movirand/compenents/loading.dart';
import 'package:movirand/models/movie_model.dart';
import 'cards_container.dart';
import '../screens/homepage.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {


  @override
  Widget build(BuildContext context) {
    return (FutureBuilder<List<MovieModel>>(
      future: data,
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
            itemBuilder: (BuildContext context, int index) =>
                CardsContainer(data: snapshot.data, index: index),
          );
        } else {
          return const Loading();
        }
      },
    ));
  }
}
