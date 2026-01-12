class Artist {
  final int id;
  final String name;
  final String picture;

  Artist({
    required this.id,
    required this.name,
    required this.picture,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      picture: json['picture'] ?? '', // fallback si pas d'image
    );
  }
}
