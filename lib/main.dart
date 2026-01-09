import 'package:ditify/Layouts/Screens/HomeScreen.dart';
import 'package:ditify/Layouts/Widgets/AppBarWidget.dart';
import 'package:flutter/material.dart';
import 'Style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWidget(),
        body: HomeScreen(),
        backgroundColor: ColorsTheme().secondaryBgColor,
      ),
    );
  }
}
