import 'package:ditify/Layouts/Screens/TrackScreen.dart';
import 'package:flutter/material.dart';
import 'package:ditify/Providers/ArtistTrackProvider.dart';
import 'package:provider/provider.dart';
import 'package:ditify/Style.dart';

class Artisttrackslistwidget extends StatefulWidget {
  final int artistId;
  const Artisttrackslistwidget({super.key, required this.artistId});

  @override
  State<Artisttrackslistwidget> createState() => _ArtisttrackslistwidgetState();
}

class _ArtisttrackslistwidgetState extends State<Artisttrackslistwidget> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context
          .read<ArtistTrackProvider>()
          .loadArtistTracks(widget.artistId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final trackProvider = context.watch<ArtistTrackProvider>();

    if (trackProvider.isLoading) {
      return Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    if (trackProvider.tracks.isEmpty) {
      return Center(
        child: Text(
          'No tracks found',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(15),
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 15.0
      ),
      itemCount: trackProvider.tracks.length,
      itemBuilder: (context, index) {
        final track = trackProvider.tracks[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TrackScreen(track: track),
              ),
            );
          },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  track.album.cover,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              track.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorsTheme().primaryTextColor,
                fontSize: 13,
              ),
            ),
          ],
        ));
      },
    );
  }
}