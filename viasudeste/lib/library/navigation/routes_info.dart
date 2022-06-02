import 'package:flutter/material.dart';
import 'package:viasudeste/src/screens/all_reviews_screen.dart';
import 'package:viasudeste/src/screens/avaliar_screen.dart';
import 'package:viasudeste/src/screens/criar_produto_screen.dart';
import 'package:viasudeste/src/screens/finalizar_compra_screen.dart';
import 'package:viasudeste/src/screens/home_screen.dart';
import 'package:viasudeste/src/screens/login_screen.dart';
import 'package:viasudeste/src/screens/my_products_screen.dart';
import 'package:viasudeste/src/screens/my_reviews_screen.dart';
import 'package:viasudeste/src/screens/orders_screen.dart';
import 'package:viasudeste/src/screens/pedido_screen.dart';
import 'package:viasudeste/src/screens/personal_data_screen.dart';
import 'package:viasudeste/src/screens/produto_screen.dart';
import 'package:viasudeste/src/screens/registrar_screen.dart';
import 'package:viasudeste/src/screens/vend_my_products_screen.dart';
import 'package:viasudeste/src/screens/vendedor_home_screen.dart';
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
      case Flows.produtos:
        return MaterialPageRoute(
          builder: (context) => MyProductsScreen(),
          settings: settings,
        );
      case Flows.avaliar:
        return MaterialPageRoute(
          builder: (context) => AvaliarScreen(),
          settings: settings,
        );
      case Flows.all_reviews:
        return MaterialPageRoute(
          builder: (context) => AllReviewsScreen(),
          settings: settings,
        );
      case Flows.vend_home:
        return MaterialPageRoute(
          builder: (context) => VendedorHomeScreen(),
          settings: settings,
        );
      case Flows.vend_produtos:
        return MaterialPageRoute(
          builder: (context) => VendedorMeusProdutos(),
          settings: settings,
        );
      case Flows.criar_produto:
        return MaterialPageRoute(
          builder: (context) => CriarProdutoScreen(),
          settings: settings,
        );
    }
  }
}