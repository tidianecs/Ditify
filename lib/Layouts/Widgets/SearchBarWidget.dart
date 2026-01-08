import 'package:flutter/material.dart';
import 'package:ditify/Style.dart';

class Searchbarwidget extends StatelessWidget {
  Searchbarwidget({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Expanded(
        child: TextField(
          controller: searchController,
          style: TextStyle(color: ColorsTheme().primaryTextColor),
          decoration: InputDecoration(
            labelText: "Search",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
            )
          ),
        )
      ),
    );
  }
}