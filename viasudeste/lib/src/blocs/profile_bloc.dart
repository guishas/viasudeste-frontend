import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/base_bloc.dart';
import 'package:viasudeste/src/models/profile_items_model.dart';

class ProfileBloc extends BaseBloc {

  final List<ProfileItemsModel> items = [
    ProfileItemsModel(iconData: Icons.person, name: 'Minha Conta'),
    ProfileItemsModel(iconData: Icons.person, name: 'Meus Pedidos'),
    ProfileItemsModel(iconData: Icons.person, name: 'Meus Pagamentos'),
    ProfileItemsModel(iconData: Icons.person, name: 'Meus Endereços'),
    ProfileItemsModel(iconData: Icons.person, name: 'Meu Carrinho'),
    ProfileItemsModel(iconData: Icons.person, name: 'Minha Lista de Desejos'),
    ProfileItemsModel(iconData: Icons.person, name: 'Minhas Avaliações'),
  ];

  void initStateScreen() {

  }

  void disposeScreen() {

    disposeBaseBloc();
  }
}