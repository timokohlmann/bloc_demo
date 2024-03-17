import 'dart:convert';

import 'package:bloc_demo/modules/homepage/presentation/album_model.dart';
import 'package:http/http.dart' as http;

class AlbumRepository {
  Future<List<Album>> fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedResponse = json.decode(response.body);

      List<Album> albums = decodedResponse
          .map<Album>((jsonItem) => Album.fromJson(jsonItem))
          .toList();

      return albums;
    } else {
      throw Exception('Failed to load albums');
    }
  }
}
