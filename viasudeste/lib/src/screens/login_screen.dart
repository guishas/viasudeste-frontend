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
      backgroundColor: Styles.mainGreyColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Image.asset(
                'assets/images/viasudeste-logo-branco.png',
                height: 200,
                width: 200,
              ),
            ),
            Text(
              'Login',
              style: TextStyle(
                color: Styles.mainWhiteColor,
                fontSize: 46,
                fontFamily: 'Cutive Mono',
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                prefixIcon: Icon(
                  Icons.person
                ),
                hintText: 'E-mail'
              ),
            )
          ],
        ),
      )
    );
  }
}