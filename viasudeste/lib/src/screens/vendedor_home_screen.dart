import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';
import 'package:viasudeste/src/blocs/home_bloc.dart';
import 'package:viasudeste/src/blocs/vendedor_home_bloc.dart';
import 'package:viasudeste/src/screens/cart_screen.dart';
import 'package:viasudeste/src/screens/categories_screen.dart';
import 'package:viasudeste/src/screens/main_screen.dart';
import 'package:viasudeste/src/screens/profile_screen.dart';
import 'package:viasudeste/src/screens/wishlist_screen.dart';

class VendedorHomeScreen extends StatefulWidget {
  const VendedorHomeScreen({ Key? key }) : super(key: key);

  @override
  State<VendedorHomeScreen> createState() => _VendedorHomeScreenState();
}

class _VendedorHomeScreenState extends State<VendedorHomeScreen> {

  late VendedorHomeBloc _bloc;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = VendedorHomeBloc();
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
          MainScreen(),
          CategoriesScreen(),
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
            ],
          );
        }
      ),
    );
  }
}