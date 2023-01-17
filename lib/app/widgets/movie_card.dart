import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movirand/app/views/movie_details_page.dart';
import '../models/movie_model.dart';
import '../theme/colors.dart';
import 'loading.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  final MovieModel data;

  const MovieCard({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double posterWidth = (MediaQuery.of(context).size.width - 25) / 2;
    return InkWell(
      onTap: () => {
        Get.to(
          () => MovieDetails(data: data),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCirc,
        ),
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Hero(
            tag: data.id,
            child: (data.posterPath != 'null')
                ? Image.network(
                    'https://image.tmdb.org/t/p/w500' + data.posterPath,
                    width: posterWidth,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const ImageLoading();
                    },
                  )
                : const ImageLoading(),
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
                  child: Text(data.title,
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
                        rating: data.voteAverage / 2,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 13,
                      ),
                      Text(data.voteAverage.toString() + '/10',
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
      ),
    );
  }
}
