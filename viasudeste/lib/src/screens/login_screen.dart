import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.mainWhiteColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Image.asset(
                'assets/images/viasudeste-logo-preto.png',
                height: 200,
                width: 200,
              ),
            ),
            Text(
              'Login',
              style: TextStyle(
                color: Styles.mainGreyColor,
                fontSize: 46,
                fontFamily: 'Cutive Mono',
                fontWeight: FontWeight.bold,
              ),
            ),
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      color: Styles.mainGreyColor,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Styles.mainGreyColor,
                  ),
                  hintText: 'E-mail',
                  hintStyle: TextStyle(
                    color: Styles.mainGreyColor,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Styles.mainGreyColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  )
                ),
                style: TextStyle(
                  color: Styles.mainGreyColor,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                        color: Styles.mainGreyColor,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_rounded,
                      color: Styles.mainGreyColor,
                    ),
                    hintText: 'Senha',
                    hintStyle: TextStyle(
                      color: Styles.mainGreyColor,
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Styles.mainGreyColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25))
                    )
                  ),
                  style: TextStyle(
                    color: Styles.mainGreyColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}