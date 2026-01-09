import 'package:ditify/Models/AlbumModel.dart';
import 'package:ditify/Models/ArtistModel.dart';

class Track {
  final int id;
  final String title;
  final String preview;
  final bool readable;
  final int rank;
  final int? track_position;
  final Artist artist;
  final Album album;
  final String release_date;

  Track({
    required this.id,
    required this.title,
    required this.preview,
    required this.rank,
    this.track_position,
    required this.album,
    required this.artist,
    required this.readable,
    required this.release_date
  });
}