import 'package:ditify/Layouts/Widgets/AppBarWidget.dart';
import 'package:ditify/Layouts/Widgets/ArtistAlbumsListWidget.dart';
import 'package:ditify/Layouts/Widgets/ArtistTracksListWidget.dart';
import 'package:ditify/Models/TopArtistModel.dart';
import 'package:ditify/Style.dart';
import 'package:flutter/material.dart';

class Artistscreen extends StatelessWidget {
  final TopArtist artist;
  const Artistscreen({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Image.network(artist.picture),
              ),
              SizedBox(height: 15),
              Center(child: Text(artist.name, style: TextStyle(color: ColorsTheme().primaryTextColor))),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("nb of albums", style: TextStyle(color: ColorsTheme().primaryTextColor)),
                      Text("${artist.albums}", style: TextStyle(color: ColorsTheme().primaryTextColor)),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 4),
                  Column(
                    children: [
                      Text("nb of fans", style: TextStyle(color: ColorsTheme().primaryTextColor)),
                      Text("${artist.fans}", style: TextStyle(color: ColorsTheme().primaryTextColor)),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width / 10),
              Text("Tracks", style: TextStyle(color: ColorsTheme().primaryTextColor, fontSize: 24))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Artisttrackslistwidget(artistId: artist.id)
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width / 10),
              Text("Albums", style: TextStyle(color: ColorsTheme().primaryTextColor, fontSize: 24))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ArtistAlbumsListWidget(artistId: artist.id)
          )
        ],
      ),
      backgroundColor: ColorsTheme().secondaryBgColor,
    );
  }
}