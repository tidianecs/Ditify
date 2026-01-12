import 'package:ditify/Models/TrackModel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TrackProvider extends ChangeNotifier{
  List<Track> popularTracks = [];

  Future<List<Track>> loadPopularTracks() async{
    final response = await http.get(
      Uri.parse('https://api.deezer.com/chart')
    );

    final data = jsonDecode(response.body);
    print(data);
    final List popularTracksJson = data['tracks']['data'];
    
    popularTracks = popularTracksJson.map(
      (pTrack) => Track.fromJson(pTrack)
    ).toList();
    
    return popularTracks;
  }
}