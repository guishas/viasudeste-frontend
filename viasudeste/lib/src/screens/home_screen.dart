import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/home_bloc.dart';
import 'package:viasudeste/src/screens/cart_screen.dart';
import 'package:viasudeste/src/screens/categories_screen.dart';
import 'package:viasudeste/src/screens/main_screen.dart';
import 'package:viasudeste/src/screens/profile_screen.dart';
import 'package:viasudeste/src/screens/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late HomeBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = HomeBloc();
    _bloc.configContext(context, _scaffoldState);
    _bloc.initStateScreen();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _bloc.pageController,
        onPageChanged: (int? index) {
          _bloc.currentNavBarIndex.sink.add(index!);
        },
        children: [
          ProfileScreen(),
          CategoriesScreen(),
          MainScreen(),
          CartScreen(),
          WishlistScreen(),
        ],
      ),
      bottomNavigationBar: StreamBuilder<int>(
        stream: _bloc.currentNavBarIndex.stream,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Styles.mainLightGreyColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _bloc.currentNavBarIndex.value,
            onTap: (int? index) {
              _bloc.currentNavBarIndex.sink.add(index!);
              _bloc.pageController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Styles.mainWhiteColor,
                ),
                label: 'Perfil',
                activeIcon: Icon(
                  Icons.person,
                  color: Styles.mainPinkColor,
                ),
                tooltip: '',
                backgroundColor: Styles.mainLightGreyColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.filter_alt,
                  color: Styles.mainWhiteColor,
                ),
                label: 'Menu',
                activeIcon: Icon(
                  Icons.filter_alt,
                  color: Styles.mainPinkColor,
                ),
                tooltip: '',
                backgroundColor: Styles.mainLightGreyColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Styles.mainWhiteColor,
                ),
                label: 'Home',
                activeIcon: Icon(
                  Icons.home,
                  color: Styles.mainPinkColor,
                ),
                tooltip: '',
                backgroundColor: Styles.mainLightGreyColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Styles.mainWhiteColor,
                ),
                label: 'Cart',
                activeIcon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Styles.mainPinkColor,
                ),
                tooltip: '',
                backgroundColor: Styles.mainLightGreyColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  color: Styles.mainWhiteColor,
                ),
                label: 'Favorites',
                activeIcon: Icon(
                  Icons.favorite_border,
                  color: Styles.mainPinkColor,
                ),
                tooltip: '',
                backgroundColor: Styles.mainLightGreyColor,
              )
            ],
          );
        }
      ),
    );
  }
}