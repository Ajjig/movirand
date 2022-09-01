import '../private.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  Future<dynamic> discover() async {
    print('Discover called');
    http.Response response = await http.get(Uri.https('api.themoviedb.org',
        '/3/discover/movie', {'api_key': apiKey, 'page': (Random().nextInt(499) + 1).toString()}));
    return jsonDecode(response.body);
  }
}

Api api = Api();
