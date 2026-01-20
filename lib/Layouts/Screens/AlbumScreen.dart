import 'package:ditify/Layouts/Widgets/AlbumTracksListWidget.dart';
import 'package:ditify/Providers/AlbumProvider.dart';
import 'package:flutter/material.dart';
import 'package:ditify/Style.dart';
import 'package:provider/provider.dart';

class AlbumScreen extends StatefulWidget {
  final int albumId;
  const AlbumScreen({super.key, required this.albumId});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final provider = context.read<AlbumProvider>();
      provider.clear();
      provider.loadAlbum(widget.albumId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final albumProvider = context.watch<AlbumProvider>();

    if (albumProvider.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    if (albumProvider.album == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            "Album not found",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    final album = albumProvider.album!;

    return Scaffold(
      backgroundColor: ColorsTheme().secondaryBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsTheme().primaryTextColor),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Image.network(
                  album.cover,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                album.title,
                style: TextStyle(
                  color: ColorsTheme().primaryTextColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                album.artistName,
                style: const TextStyle(color: Color.fromARGB(150, 158, 158, 158)),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: AlbumTracksListWidget()
          )
        ],
      ),
    );
  }
}
