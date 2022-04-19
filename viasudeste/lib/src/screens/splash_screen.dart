import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/flows.dart';
import 'package:viasudeste/library/utilities/login_helper.dart';
import 'package:viasudeste/library/utilities/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  LoginHelper loginHelper = LoginHelper();

  bool moveAnimation = false;
  bool isUserLogged = false;
  int splashScreenDuration = 3000; // milliseconds

  @override
  void initState() {
    startAnimation();

    super.initState();
  }

  void startApp() async {
    isUserLogged = await loginHelper.getSharedPreferencesValue('isUserLogged');

    await Future.delayed(Duration(milliseconds: splashScreenDuration), () {
      if (isUserLogged) {
        Navigator.pushReplacementNamed(context, Flows.home);    
      } else {
        Navigator.pushReplacementNamed(context, Flows.login);
      }
    });
  }

  void startAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        moveAnimation = true;
      });
    });

    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.mainGreyColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            AnimatedPositioned(
              top: moveAnimation ? MediaQuery.of(context).size.height/2 - 150 : -250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/viasudeste-logo-branco.png',
                    height: 300,
                    width: 300,
                  ),
                ],
              ), 
              duration: Duration(
                milliseconds: 1400,
              ),
              curve: Curves.decelerate,
            ),
          ],
        ),
      ),
    );
  }
}