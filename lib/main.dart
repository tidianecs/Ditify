import 'package:ditify/Layouts/Screens/LoadingScreen.dart';
import 'package:ditify/Providers/AlbumProvider.dart';
import 'package:ditify/Providers/ArtistAlbumProvider.dart';
import 'package:ditify/Providers/ArtistTrackProvider.dart';
import 'package:ditify/Providers/SearchProvider.dart';
import 'package:ditify/Providers/TopArtitsProvider.dart';
import 'package:ditify/Providers/TrackProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TrackProvider()),
        ChangeNotifierProvider(create: (_) => TopArtistProvider()),
        ChangeNotifierProvider(create: (_) => ArtistTrackProvider()),
        ChangeNotifierProvider(create: (_) => ArtistAlbumProvider()),
        ChangeNotifierProvider(create: (_) => AlbumProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider())
      ],
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen()
    );
  }
}
