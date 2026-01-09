import 'package:ditify/Models/ArtistModel.dart';
import 'package:ditify/Models/GenreModel.dart';

class Album {
  final int id;
  final String title;
  final String cover;
  final List<Genre> genres;
  final int duration;
  //final List<Track> tracks;
  final Artist artist; 

  Album({
    required this.id,
    required this.title,
    required this.cover,
    required this.genres,
    required this.duration,
    //required this.tracks,
    required this.artist
  });
}