class TopArtist {
  final int id;
  final String name;
  final String picture;
  final int fans;
  final int albums;

  TopArtist({
    required this.id,
    required this.name,
    required this.picture,
    required this.fans,
    required this.albums,
  });

  factory TopArtist.fromJson(Map<String, dynamic> json) {
    return TopArtist(
      id: json['id'],
      name: json['name'],
      picture: json['picture_medium'] ?? '',
      fans: json['nb_fan'] ?? 0,
      albums: json['nb_album'] ?? 0,
    );
  }
}
