import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ditify/Models/TrackModel.dart';

class ArtistTrackProvider extends ChangeNotifier {
  List<Track> tracks = [];
  bool isLoading = false;

  Future<void> loadArtistTracks(int artistId) async {
    isLoading = true;
    notifyListeners();

    final res = await http.get(
      Uri.parse('https://api.deezer.com/artist/$artistId/top?limit=50'),
    );

    final data = jsonDecode(res.body);
    print(data);

    tracks = (data['data'] as List)
        .map((e) => Track.fromJson(e))
        .toList();

    isLoading = false;
    notifyListeners();
  }

  void clear() {
    tracks.clear();
  }
}
