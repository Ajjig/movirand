import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../theme/colors.dart';
import '..//widgets/loading.dart';
import '../provider/api.dart';
import '../models/movie_model.dart';
import '../data/CONSTANTS.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel data;
  const MovieDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.favorite,
                size: 30,
                color: mainColor,
              ),
              onPressed: () {}),
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
                          IMAGE_BASE_URL +
                              data.backdropPath.toString(),
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
                                    IMAGE_BASE_URL +
                                        data.posterPath,
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
              thickness: 3,
              indent: 25,
              endIndent: 25,
            ),
            // Container(
            //   height: 20,
            //   color: bgColor,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: List.generate(
            //       data.genres.length,
            //       (index) => Text(
            //         data.genres[index],
            //         style: const TextStyle(
            //           fontSize: 12,
            //           fontWeight: FontWeight.w500,
            //           color: Colors.grey,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Divider(
            //   height: 20,
            //   color: mainColor,
            //   thickness: 3,
            //   indent: 25,
            //   endIndent: 25,
            // ),
            SizedBox(
              height: 110,
              child: FutureBuilder<dynamic>(
                  future: api.getActors(data),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                   // TODO: Navigate to actor details
                                },
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: mainColor,
                                  backgroundImage: NetworkImage(
                                      (snapshot.data[index]['profile_path'] != null) ?
                                      'https://image.tmdb.org/t/p/w200' + snapshot.data[index]['profile_path'] :
                                      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                                    ),
                                ),
                              ),
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
}
