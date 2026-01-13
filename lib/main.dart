import 'package:ditify/Layouts/Screens/HomeScreen.dart';
import 'package:ditify/Layouts/Screens/LoadingScreen.dart';
import 'package:ditify/Layouts/Widgets/AppBarWidget.dart';
import 'package:ditify/Providers/ArtistTrackProvider.dart';
import 'package:ditify/Providers/TopArtitsProvider.dart';
import 'package:ditify/Providers/TrackProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Style.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TrackProvider()),
        ChangeNotifierProvider(create: (_) => TopArtistProvider()),
        ChangeNotifierProvider(create: (_) => ArtistTrackProvider())
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
