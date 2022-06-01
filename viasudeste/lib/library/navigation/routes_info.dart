import 'package:flutter/material.dart';
import 'package:viasudeste/src/screens/finalizar_compra_screen.dart';
import 'package:viasudeste/src/screens/home_screen.dart';
import 'package:viasudeste/src/screens/login_screen.dart';
import 'package:viasudeste/src/screens/my_reviews_screen.dart';
import 'package:viasudeste/src/screens/orders_screen.dart';
import 'package:viasudeste/src/screens/pedido_screen.dart';
import 'package:viasudeste/src/screens/personal_data_screen.dart';
import 'package:viasudeste/src/screens/produto_screen.dart';
import 'package:viasudeste/src/screens/registrar_screen.dart';
import 'flows.dart';

class RoutesInfo {

  static dynamic getRoutes(dynamic settings) {
    switch (settings.name) {
      case Flows.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      case Flows.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
          settings: settings,
        );
      case Flows.registrar:
        return MaterialPageRoute(
          builder: (context) => RegistrarScreen(),
          settings: settings,
        );
      case Flows.personal:
        return MaterialPageRoute(
          builder: (context) => PersonalDataScreen(),
          settings: settings,
        );
      case Flows.produto:
        return MaterialPageRoute(
          builder: (context) => ProdutoScreen(),
          settings: settings,
        );
      case Flows.avaliacoes:
        return MaterialPageRoute(
          builder: (context) => MyReviewsScreen(),
          settings: settings,
        );
      case Flows.finalizar:
        return MaterialPageRoute(
          builder: (context) => FinalizarCompraScreen(),
          settings: settings,
        );
      case Flows.pedidos:
        return MaterialPageRoute(
          builder: (context) => OrdersScreen(),
          settings: settings,
        );
      case Flows.pedido:
        return MaterialPageRoute(
          builder: (context) => PedidoScreen(),
          settings: settings,
        );
    }
  }
}