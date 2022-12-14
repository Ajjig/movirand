import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:movirand/app/controllers/favorites_controller.dart';
import 'package:movirand/app/models/actors_model.dart';
import '../theme/colors.dart';
import '..//widgets/loading.dart';
import '../provider/api.dart';
import '../models/movie_model.dart';
import '../data/CONSTANTS.dart';
import 'package:get/get.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel data;
  final FavsController controller = Get.find<FavsController>();

  MovieDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        actions: [
          IconButton(icon: GetX<FavsController>(builder: (controller) {
            return Icon(
              controller.isFavorite(data)
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: 30,
              color: mainColor,
            );
          }), onPressed: () {
            if (controller.isFavorite(data)) {
              controller.remove(data);
            } else {
              controller.add(data);
            }
          }),
          IconButton(
              icon: Icon(Icons.ios_share_rounded, size: 30, color: mainColor),
              onPressed: () {}),
        ],
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              height: 300,
              child: Stack(
                children: [
                  (data.backdropPath != 'null')
                      ? Image.network(
                          IMAGE_BASE_URL + data.backdropPath.toString(),
                          fit: BoxFit.fill)
                      : const LoadingIndicator(
                          indicatorType: Indicator.lineScaleParty,
                          colors: [
                            Colors.white,
                            Color(0xFFFF2745),
                            Colors.greenAccent
                          ],
                          backgroundColor: Colors.transparent,
                        ),
                  Positioned(
                    top: 125,
                    height: 175,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Hero(
                          tag: data.id,
                          child: Center(
                            child: (data.posterPath != 'null')
                                ? Image.network(
                                    IMAGE_BASE_URL + data.posterPath,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
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
                              child: Text(data.overview,
                                  style: const TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              color: mainColor,
              thickness: 1,
              indent: 25,
              endIndent: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                data.genres.length,
                (index) => InkWell(
                  onTap: () {
                    // TODO: Navigate to genre details
                  },
                  child: Chip(
                    label: Text(data.genres[index]),
                    backgroundColor: Colors.teal[500],
                  ),
                ),
              ),
            ),
            Divider(
              height: 20,
              color: mainColor,
              thickness: 1,
              indent: 25,
              endIndent: 25,
            ),
            SizedBox(
              height: 110,
              child: FutureBuilder<List<ActorsModel>>(
                  future: api.getActors(data),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  enableFeedback: false,
                                  onTap: () {
                                    Get.snackbar(
                                      snapshot.data![index].name,
                                      snapshot.data![index].character,
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.teal[500],
                                      colorText: Colors.white,
                                      margin: const EdgeInsets.all(10),
                                      borderRadius: 10,
                                      duration: const Duration(seconds: 1),
                                      icon: actorCircleAvatar(
                                          snapshot.data![index].profilePath),
                                      overlayBlur: 2,
                                      overlayColor: mainColor.withOpacity(0.01),
                                    );
                                  },
                                  child: actorCircleAvatar(
                                      snapshot.data![index].profilePath,
                                      radius: 35)),
                            );
                          });
                    } else {
                      return const Loading();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  CircleAvatar actorCircleAvatar(String profilePath, {double radius = 20}) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(
        profilePath,
      ),
    );
  }
}
