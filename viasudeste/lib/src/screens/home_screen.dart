import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'HOME' + ObjMem.currentUser!.clienteId.toString(),
        ),
      ),
    );
  }
}