import 'package:ditify/Layouts/Widgets/PopularArtistListWidget.dart';
import 'package:ditify/Layouts/Widgets/PopularTrackListWidget.dart';
import 'package:flutter/material.dart';
import 'package:ditify/Style.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({super.key});

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top Song", style: TextStyle(color: ColorsTheme().primaryTextColor, fontSize: 24)),
              /*Make a Text Button*/Text("see all", style: TextStyle(color: ColorsTheme().primaryTextColor))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4, 
            child: PopularTrackListWidget()
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top Artists", style: TextStyle(color: ColorsTheme().primaryTextColor, fontSize: 24)),
              /*Make a Text Button*/Text("see all", style: TextStyle(color: ColorsTheme().primaryTextColor))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4, 
            child: PopularArtistListWidget()
          )
        ],
      ),
    );
  }
}