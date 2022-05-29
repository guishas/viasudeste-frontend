import 'package:shared_preferences/shared_preferences.dart';
import 'package:viasudeste/src/models/cart_produto_model.dart';

class SharedPreferencesHelper {

  void addBoolToSharedPreferences(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  void addStringToSharedPreferences(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<bool> getSharedPreferencesBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  Future<String> getSharedPreferencesStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  Future<bool> hasValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberUser', false);
  }

  Future<void> addItemToCart(CartProdutoModel produtoModel) async {
    if (await hasValue("cart")) {
      String cart = await getSharedPreferencesStringValue("cart");

      final List<CartProdutoModel> produtos = CartProdutoModel.decode(cart);

      produtos.add(produtoModel);

      final String encodedProdutos = CartProdutoModel.encode(produtos);

      addStringToSharedPreferences("cart", encodedProdutos);
    } else {
      final List<CartProdutoModel> produtos = [];

      produtos.add(produtoModel);

      final String encodedProdutos = CartProdutoModel.encode(produtos);

      addStringToSharedPreferences("cart", encodedProdutos);
    }
  }

  Future<List<CartProdutoModel>?> removeItemFromCart(String produtoId) async {
    String cart = await getSharedPreferencesStringValue("cart");

    final List<CartProdutoModel> produtos = CartProdutoModel.decode(cart);

    produtos.removeWhere((model) => model.produtoId.toString() == produtoId);

    final String encodedProdutos = CartProdutoModel.encode(produtos);

    addStringToSharedPreferences("cart", encodedProdutos);

    return produtos;
  }

  Future<List<CartProdutoModel>?> getCart() async {
    if (await hasValue("cart")) {
      String cart = await getSharedPreferencesStringValue("cart");

      final List<CartProdutoModel> produtos = CartProdutoModel.decode(cart);

      return produtos;
    }

    return [];
  }

  Future<void> emptyCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("cart");
  }
}