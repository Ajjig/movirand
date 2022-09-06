import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:movirand/colors.dart';
import 'package:movirand/compenents/loading.dart';

class MovieDetails extends StatelessWidget {
  final dynamic data;
  const MovieDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: bgColor,
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.favorite, size: 30, color: mainColor,), onPressed: () {}),
          IconButton(icon: Icon(Icons.ios_share_rounded, size: 30, color: mainColor), onPressed: () {}),
        ],
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              (data['backdrop_path'] != null)
              ? Image.network('https://image.tmdb.org/t/p/w500' + data['backdrop_path'], fit: BoxFit.fill)
              : const LoadingIndicator(
                indicatorType: Indicator.lineScaleParty,
                colors: [Colors.white, Color(0xFFFF2745), Colors.greenAccent],
                backgroundColor: Colors.transparent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Hero(
                    tag: data['id'].toString(),
                    child: Center(
                      child: (data['poster_path'] != null)
                          ? Image.network(
                              'https://image.tmdb.org/t/p/w500' +
                                  data['poster_path'],
                              width: MediaQuery.of(context).size.width / 3,
                              fit: BoxFit.fill,
                            )
                          : const ImageLoading(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        color: const Color(0XAA000000),
                        child: Text(data['overview'].toString(),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
