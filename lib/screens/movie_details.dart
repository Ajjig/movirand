import 'package:flutter/material.dart';
import 'package:movirand/colors.dart';

class MovieDetails extends StatelessWidget {
  final dynamic data;
  const MovieDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: const Color(0xCC011627),
      ),
      body: Hero(
        tag: data['id'].toString(),
        child: Center(
          child: Image.network(
            'https://image.tmdb.org/t/p/w500' + data['poster_path'],
            width: MediaQuery.of(context).size.width - 10,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );

  }
}
