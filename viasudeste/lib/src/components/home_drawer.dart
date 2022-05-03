import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Styles.mainPinkColor,
              Styles.mainLightPinkColor,
            ]
          )
        ),
        child: ListView(
          children: [
            
          ],
        ),
      ),
    );
  }
}