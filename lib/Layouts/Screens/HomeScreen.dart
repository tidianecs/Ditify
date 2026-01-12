import 'package:ditify/Layouts/Widgets/HomeBodyWidget.dart';
import 'package:ditify/Layouts/Widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Searchbarwidget(),
          HomeBodyWidget()
        ],
      ),
    );
  }
}