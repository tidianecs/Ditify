import 'dart:convert';
import 'package:ditify/Models/TheAlbumModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumProvider extends ChangeNotifier {
  TheAlbum? album;
  bool isLoading = false;

  Future<void> loadAlbum(int albumId) async {
    isLoading = true;
    notifyListeners();

    final res = await http.get(
      Uri.parse('https://api.deezer.com/album/$albumId'),
    );

    final data = jsonDecode(res.body);
    album = TheAlbum.fromJson(data);

    isLoading = false;
    notifyListeners();
  }

  void clear() {
    album = null;
  }
}
