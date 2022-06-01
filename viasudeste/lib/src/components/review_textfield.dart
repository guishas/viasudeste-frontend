import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viasudeste/library/utilities/styles.dart';

class ReviewTextField extends StatelessWidget {

  final String? Function(String?) validator;
  final TextEditingController controller;
  final String labelText;
  final List<TextInputFormatter> formatters;
  final int? maxLines;

  const ReviewTextField({
    Key? key,
    required this.validator,
    required this.controller,
    required this.labelText,
    required this.formatters,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      inputFormatters: formatters,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Styles.mainGreyColor,
          ),
        ),
        hintStyle: TextStyle(
          color: Styles.mainGreyColor,
          fontWeight: FontWeight.bold,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Styles.mainGreyColor,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Styles.mainGreyColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
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