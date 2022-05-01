import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  
  void showsSnackBar(BuildContext context, Widget widget) {
    final SnackBar snackbar = SnackBar(
      content: widget,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future<bool> launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      return false;
    } else {
      return true;
    }
  }
}