import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// A helper function to launch a URL.
///
/// It parses the string as a [Uri] and uses [launchUrl] to open it.
/// If it fails, it will print a debug message.
Future<void> launchAppUrl(String urlString) async {
  // Add 'https://' if the URL doesn't have a scheme
  if (!urlString.startsWith('http://') && !urlString.startsWith('https://')) {
    urlString = 'https://$urlString';
  }

  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url)) {
    debugPrint('Could not launch $urlString');
  }
}
