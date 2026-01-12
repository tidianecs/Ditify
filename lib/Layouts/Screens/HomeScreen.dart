import 'package:ditify/Layouts/Widgets/HomeBodyWidget.dart';
import 'package:ditify/Layouts/Widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:ditify/Style.dart';
import 'package:ditify/Layouts/Widgets/AppBarWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: SafeArea(
          child: ListView(
            children: [
              Searchbarwidget(),
              Expanded(child: HomeBodyWidget())
            ],
          ),
        ),
        backgroundColor: ColorsTheme().secondaryBgColor,
      );
  }
}