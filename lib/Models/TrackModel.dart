import 'AlbumModel.dart';
import 'ArtistModel.dart';

class Track {
  final int id;
  final String title;
  final String preview;
  final bool readable;
  final int? rank;
  final Artist artist;
  final Album album;

  Track({
    required this.id,
    required this.title,
    required this.preview,
    required this.readable,
    this.rank,
    required this.artist,
    required this.album,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['id'],
      title: json['title'],
      preview: json['preview'],
      readable: json['readable'] ?? true,
      rank: json['rank'],
      artist: Artist.fromJson(json['artist']),
      album: Album.fromJson(json['album']),
    );
  }
}
