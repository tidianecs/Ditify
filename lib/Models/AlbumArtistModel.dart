class AlbumArtist {
  final int id;
  final String title;
  final String cover;
  final int trackCount;

  AlbumArtist({
    required this.id,
    required this.title,
    required this.cover,
    required this.trackCount,
  });

  factory AlbumArtist.fromJson(Map<String, dynamic> json) {
    return AlbumArtist(
      id: json['id'],
      title: json['title'],
      cover: json['cover_medium'] ?? '',
      trackCount: json['nb_tracks'] ?? 0,
    );
  }
}
