import 'package:url_launcher/url_launcher.dart';

class Utils {
  // snackbar

  Future<bool> launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      return false;
    } else {
      return true;
    }
  }
}