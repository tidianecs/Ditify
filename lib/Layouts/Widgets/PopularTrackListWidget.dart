import 'package:ditify/Layouts/Screens/TrackScreen.dart';
import 'package:flutter/material.dart';
import 'package:ditify/Providers/TrackProvider.dart';
import 'package:ditify/Style.dart';
import 'package:provider/provider.dart';

class PopularTrackListWidget extends StatefulWidget {
  const PopularTrackListWidget({super.key});

  @override
  State<PopularTrackListWidget> createState() => _PopularTrackListWidgetState();
}

class _PopularTrackListWidgetState extends State<PopularTrackListWidget> {
  @override
  Widget build(BuildContext context) {
    final trackProvider = context.watch<TrackProvider>();

    return FutureBuilder(
      future: trackProvider.loadPopularTracks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.white));
        }

        if (trackProvider.popularTracks.isEmpty) {
          return Center(child: Text("No tracks found"));
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisSpacing: 15.0, childAspectRatio: 1.8),
          scrollDirection: Axis.horizontal,
          // padding: EdgeInsets.all(15),
          itemCount: trackProvider.popularTracks.length,
          itemBuilder: (context, index) {
            final track = trackProvider.popularTracks[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TrackScreen(track: track),
                  ),
                );
              },
              child: Container(
               // width: 150,
               // height: 100,
               // margin: EdgeInsets.only(right: 10),
                child: GridTile(
                 // header: Icon(Icons.menu),
                  footer: Column(
                    children: [
                      Text(track.title, style: TextStyle(color: ColorsTheme().primaryTextColor, fontSize: 12)),
                      Text(track.artist.name, style: TextStyle(color: ColorsTheme().primaryTextColor, fontSize: 10)),
                    ],
                  ),
                  child: Image.network(track.album.cover),
                ),
              ),
            );
          },
        );
      },
    );
  }

}