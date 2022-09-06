import '../private.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class Api {
  Future<dynamic> discover() async {
    print('Discover called');
    http.Response response = await http.get(Uri.https(
        'api.themoviedb.org', '/3/discover/movie', {
      'api_key': apiKey,
      'page': (Random().nextInt(499) + 1).toString()
    })); // apiKey contains my private api key..
    return jsonDecode(response.body); // get yours here => https://developers.themoviedb.org/3/getting-started/introduction
  }

  Future<dynamic> getActors(dynamic data) async {
    print('getActors called');
    http.Response response = await http.get(Uri.https(
        'api.themoviedb.org', "/3/movie/" + data['id'].toString() + '/credits', {'api_key': apiKey}));
    return jsonDecode(response.body);
  }
}

Api api = Api();
