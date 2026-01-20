import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ditify/Models/TrackModel.dart';

class SearchProvider extends ChangeNotifier {
  List<Track> results = [];
  bool isLoading = false;

  Future<void> search(String query) async {
    if (query.isEmpty) {
      results.clear();
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    final res = await http.get(
      Uri.parse('https://api.deezer.com/search?q=$query'),
    );

    final data = jsonDecode(res.body);

    results = (data['data'] as List)
        .map((e) => Track.fromJson(e))
        .toList();

    isLoading = false;
    notifyListeners();
  }

  void clear() {
    results.clear();
    notifyListeners();
  }
}
