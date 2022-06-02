import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viasudeste/library/utilities/styles.dart';

class CreateProductTextField extends StatelessWidget {

  final String hintText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final String labelText;
  final List<TextInputFormatter> formatters;
  final int? maxLines;

  const CreateProductTextField({
    Key? key,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.labelText,
    required this.formatters,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      inputFormatters: formatters,
      textAlignVertical: TextAlignVertical.top,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Styles.mainGreyColor,
          ),
        ),
        hintText: hintText,
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