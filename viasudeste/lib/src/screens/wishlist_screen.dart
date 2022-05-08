import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({ Key? key }) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.mainLightGreyColor,
        title: Text(
          'Lista de Desejos',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('WISHLIST'),
      ),
    );
  }
}