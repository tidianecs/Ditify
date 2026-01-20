import 'TrackModel.dart';

class TheAlbum {
  final int id;
  final String title;
  final String cover;
  final String artistName;
  final List<Track> tracks;

  TheAlbum({
    required this.id,
    required this.title,
    required this.cover,
    required this.artistName,
    required this.tracks,
  });

  factory TheAlbum.fromJson(Map<String, dynamic> json) {
    return TheAlbum(
      id: json['id'],
      title: json['title'],
      cover: json['cover_xl'],
      artistName: json['artist']['name'],
      tracks: (json['tracks']['data'] as List)
          .map((e) => Track.fromJson(e))
          .toList(),
    );
  }
}
