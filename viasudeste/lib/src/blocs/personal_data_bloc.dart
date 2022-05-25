import 'package:flutter/cupertino.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/library/utilities/obj_mem.dart';
import 'package:viasudeste/src/models/user_model.dart';

class PersonalDataBloc extends BaseBloc {

  UserModel? user;

  final TextEditingController emailController = TextEditingController(text: null);
  final TextEditingController celularController = TextEditingController(text: null);
  final TextEditingController cpfController = TextEditingController(text: null);

  void initStateScreen() {
    user = ObjMem.currentUser;
  }

  void disposeScreen() {

    disposeBaseBloc();
  }

}