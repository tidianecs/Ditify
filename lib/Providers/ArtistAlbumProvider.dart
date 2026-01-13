import 'dart:convert';
import 'package:ditify/Models/AlbumArtistModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ArtistAlbumProvider extends ChangeNotifier {
  List<AlbumArtist> albums = [];
  bool isLoading = false;

  Future<void> loadArtistAlbums(int artistId) async {
    isLoading = true;
    notifyListeners();

    final res = await http.get(
      Uri.parse('https://api.deezer.com/artist/$artistId/albums'),
    );

    final data = jsonDecode(res.body);
    print(data);

    albums = (data['data'] as List)
        .map((e) => AlbumArtist.fromJson(e))
        .toList();

    isLoading = false;
    notifyListeners();
  }

  void clear() {
    albums.clear();
  }
}
