import 'package:flutter/material.dart';
import 'package:ditify/Style.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      leading: Center(child: Text("Ditify", style: TextStyle(color: ColorsTheme().primaryTextColor, fontSize: 20, fontWeight: FontWeight.w700))),
      actions: [
        Icon(Icons.favorite, color: ColorsTheme().primaryTextColor),
        SizedBox(width: 20),
        Icon(Icons.settings, color: ColorsTheme().primaryTextColor),
        SizedBox(width: 25)
      ],
      backgroundColor: Colors.transparent,
    );
  }
}