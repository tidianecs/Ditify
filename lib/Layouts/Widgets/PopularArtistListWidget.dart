import 'package:flutter/material.dart';
import 'package:ditify/Providers/TopArtitsProvider.dart';
import 'package:ditify/Style.dart';
import 'package:provider/provider.dart';

class PopularArtistListWidget extends StatefulWidget {
  const PopularArtistListWidget({super.key});

  @override
  State<PopularArtistListWidget> createState() => _PopularTrackListWidgetState();
}

class _PopularTrackListWidgetState extends State<PopularArtistListWidget> {
  @override
  Widget build(BuildContext context) {
    final artistProvider = context.watch<TopArtistProvider>();

    return FutureBuilder(
      future: artistProvider.loadTopArtists(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (artistProvider.artists.isEmpty) {
          return Center(child: Text("No artits found"));
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisSpacing: 15.0, childAspectRatio: 1.8),
          scrollDirection: Axis.horizontal,
          // padding: EdgeInsets.all(15),
          itemCount: artistProvider.artists.length,
          itemBuilder: (context, index) {
            final artist = artistProvider.artists[index];
            return Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(artist.picture),
                ),
                SizedBox(height: 8),
                Text(artist.name, style: TextStyle(color: ColorsTheme().primaryTextColor, fontSize: 12)),
              ],
            );
          },
        );
      },
    );

  }

}