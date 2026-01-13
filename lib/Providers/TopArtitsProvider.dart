import 'package:ditify/Models/TrackModel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:ditify/Models/TopArtistModel.dart';
import 'package:http/http.dart' as http;

class TopArtistProvider extends ChangeNotifier {
  List<TopArtist> artists = [];

  Future<void> loadTopArtists() async {
    final res = await http.get(
      Uri.parse('https://api.deezer.com/chart/0/artists'),
    );

    final data = jsonDecode(res.body);
    artists = (data['data'] as List)
        .map((e) => TopArtist.fromJson(e))
        .toList();
  }
}
