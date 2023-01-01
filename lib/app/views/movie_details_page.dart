import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:movirand/app/models/actors_model.dart';
import '../theme/colors.dart';
import '..//widgets/loading.dart';
import '../provider/api.dart';
import '../models/movie_model.dart';
import '../data/CONSTANTS.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MovieDetails extends StatefulWidget {
  final MovieModel data;
  const MovieDetails({Key? key, required this.data}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final box = GetStorage('favorites');
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    isFavorite = box.read(widget.data.id.toString()) != null ? true : false;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 30,
                color: mainColor,
              ),
              onPressed: () {
                if (isFavorite) {
                  box.remove(widget.data.id.toString());
                  setState(() {
                    isFavorite = false;
                  });
                } else {
                  box.write(widget.data.id.toString(), widget.data);
                  setState(() {
                    isFavorite = true;
                  });
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
                  (widget.data.backdropPath != 'null')
                      ? Image.network(
                          IMAGE_BASE_URL + widget.data.backdropPath.toString(),
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
                          tag: widget.data.id,
                          child: Center(
                            child: (widget.data.posterPath != 'null')
                                ? Image.network(
                                    IMAGE_BASE_URL + widget.data.posterPath,
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
                              child: Text(widget.data.overview,
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
                widget.data.genres.length,
                (index) => InkWell(
                  onTap: () {
                    // TODO: Navigate to genre details
                  },
                  child: Chip(
                    label: Text(widget.data.genres[index]),
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
                  future: api.getActors(widget.data),
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
