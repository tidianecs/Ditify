import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ditify/Models/TrackModel.dart';
import 'package:ditify/Style.dart';

class TrackScreen extends StatefulWidget {
  final Track track;

  const TrackScreen({super.key, required this.track});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> togglePlay() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(widget.track.preview));
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    final track = widget.track;

    return Scaffold(
      backgroundColor: ColorsTheme().secondaryBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsTheme().primaryTextColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                track.album.cover,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      track.title,
                      style: TextStyle(
                        color: ColorsTheme().primaryTextColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                        Text(
                          track.artist.name,
                          style: TextStyle(
                            color: ColorsTheme().primaryTextColor,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 80)
                  ],
                ),
                Icon(Icons.favorite, color: ColorsTheme().primaryTextColor)
              ],
            ),
            const Spacer(),
            /// Play / Pause button
            IconButton(
              onPressed: togglePlay,
              iconSize: 70,
              icon: Icon(
                isPlaying ? Icons.pause_circle : Icons.play_circle,
                color: ColorsTheme().primaryTextColor,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
