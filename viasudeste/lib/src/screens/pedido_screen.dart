import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';

class PedidoScreen extends StatefulWidget {
  const PedidoScreen({ Key? key }) : super(key: key);

  @override
  State<PedidoScreen> createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Styles.mainLightGreyColor,
      ),
    );
  }
}