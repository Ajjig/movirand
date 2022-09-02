import 'package:flutter/material.dart';
import 'package:movirand/compenents/loading.dart';
import '../api/api.dart';
import 'cards_container.dart';


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

