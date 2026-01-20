import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditify/Providers/SearchProvider.dart';
import 'package:ditify/Style.dart';
import 'package:ditify/Layouts/Screens/TrackScreen.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();

    if (provider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    if (provider.results.isEmpty) {
      return const SizedBox();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider.results.length,
      itemBuilder: (context, index) {
        final track = provider.results[index];

        return ListTile(
          leading: Image.network(
            track.album.cover,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(
            track.title,
            style: TextStyle(color: ColorsTheme().primaryTextColor),
          ),
          subtitle: Text(
            track.artist.name,
            style: const TextStyle(color: Colors.grey),
          ),
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
