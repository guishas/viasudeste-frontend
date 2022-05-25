import 'package:flutter/material.dart';
import 'package:viasudeste/library/utilities/styles.dart';

class PersonalTextField extends StatelessWidget {

  final String hintText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final IconData icon;

  const PersonalTextField({
    Key? key,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: Styles.mainGreyColor,
          ),
        ),
        prefixIcon: Icon(
          icon,
          color: Styles.mainGreyColor,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Styles.mainGreyColor,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Styles.mainGreyColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        errorStyle: TextStyle(
          fontFamily: 'Calibri',
        )
      ),
      cursorColor: Styles.mainGreyColor,
      style: TextStyle(
        color: Styles.mainGreyColor,
        fontWeight: FontWeight.bold
      ),
      validator: validator,
    );
  }
}