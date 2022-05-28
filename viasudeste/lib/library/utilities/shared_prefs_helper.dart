import 'package:shared_preferences/shared_preferences.dart';
import 'package:viasudeste/src/models/produto_model.dart';

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

  Future<void> addItemToCart(ProdutoModel produtoModel) async {
    if (await hasValue("cart")) {
      String cart = await getSharedPreferencesStringValue("cart");

      final List<ProdutoModel> produtos = ProdutoModel.decode(cart);

      produtos.add(produtoModel);

      final String encodedProdutos = ProdutoModel.encode(produtos);

      addStringToSharedPreferences("cart", encodedProdutos);
    } else {
      final List<ProdutoModel> produtos = [];

      produtos.add(produtoModel);

      final String encodedProdutos = ProdutoModel.encode(produtos);

      addStringToSharedPreferences("cart", encodedProdutos);
    }
  }

  Future<void> removeItemFromCart(String produtoId) async {
    String cart = await getSharedPreferencesStringValue("cart");

    final List<ProdutoModel> produtos = ProdutoModel.decode(cart);

    produtos.removeWhere((model) => model.produtoId == produtoId);

    final String encodedProdutos = ProdutoModel.encode(produtos);

    addStringToSharedPreferences("cart", encodedProdutos);
  }

  Future<List<ProdutoModel>?> getCart() async {
    if (await hasValue("cart")) {
      String cart = await getSharedPreferencesStringValue("cart");

      final List<ProdutoModel> produtos = ProdutoModel.decode(cart);

      return produtos;
    }

    return [];
  }
}