import 'package:ditify/Layouts/Screens/AlbumScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditify/Providers/ArtistAlbumProvider.dart';
import 'package:ditify/Style.dart';

class ArtistAlbumsListWidget extends StatefulWidget {
  final int artistId;
  const ArtistAlbumsListWidget({super.key, required this.artistId});

  @override
  State<ArtistAlbumsListWidget> createState() =>
      _ArtistAlbumsListWidgetState();
}

class _ArtistAlbumsListWidgetState extends State<ArtistAlbumsListWidget> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final provider = context.read<ArtistAlbumProvider>();
      provider.clear();
      provider.loadArtistAlbums(widget.artistId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final albumProvider = context.watch<ArtistAlbumProvider>();

    if (albumProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    if (albumProvider.albums.isEmpty) {
      return const Center(
        child: Text(
          'No albums found',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 15.0
      ),
      itemCount: albumProvider.albums.length,
      itemBuilder: (context, index) {
        final album = albumProvider.albums[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AlbumScreen(albumId: album.id),
              ),
            );
          },
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  album.cover,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              album.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorsTheme().primaryTextColor,
                fontSize: 13,
              ),
            ),
            Text(
              '${album.trackCount} tracks',
              style: TextStyle(
                color: ColorsTheme().primaryTextColor,
                fontSize: 11,
              ),
            ),
          ],
        ));
      },
    );
  }
}
