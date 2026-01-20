import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditify/Providers/AlbumProvider.dart';
import 'package:ditify/Style.dart';
import 'package:ditify/Layouts/Screens/TrackScreen.dart';

class AlbumTracksListWidget extends StatelessWidget {
  const AlbumTracksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final albumProvider = context.watch<AlbumProvider>();
    final album = albumProvider.album!;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: album.tracks.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final track = album.tracks[index];

        return ListTile(
          leading: Text(
            '${index + 1}',
            style: TextStyle(color: ColorsTheme().primaryTextColor),
          ),
          title: Text(
            track.title,
            style: TextStyle(color: ColorsTheme().primaryTextColor),
          ),
          subtitle: Text(
            album.artistName,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: const Icon(Icons.play_arrow, color: Colors.white),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TrackScreen(track: track),
              ),
            );
          },
        );
      },
    );
  }
}
