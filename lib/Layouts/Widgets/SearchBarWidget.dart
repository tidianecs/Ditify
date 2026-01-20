import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditify/Providers/SearchProvider.dart';
import 'package:ditify/Style.dart';

class Searchbarwidget extends StatelessWidget {
  Searchbarwidget({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          context.read<SearchProvider>().search(value);
        },
        style: TextStyle(color: ColorsTheme().primaryTextColor),
        decoration: InputDecoration(
          labelText: "Search",
          labelStyle: TextStyle(color: ColorsTheme().primaryTextColor),
          prefixIcon: Icon(Icons.search, color: ColorsTheme().primaryTextColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
