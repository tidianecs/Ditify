import 'package:ditify/Models/ArtistModel.dart';

class Album {
  final int id;
  final String title;
  final String cover;

  Album({
    required this.id,
    required this.title,
    required this.cover,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
      cover: json['cover_medium'] ?? '', // fallback
    );
  }
}
