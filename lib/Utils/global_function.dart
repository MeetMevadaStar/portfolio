import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchMap() async {
  final Uri googleMapUrl = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=23.095826377558456,72.66432418841963',
  );

  final bool launched = await launchUrl(
    googleMapUrl,
    mode: LaunchMode.externalApplication,
  );

  if (!launched) {
    debugPrint('Could not launch map');
  }
}

Future<void> launchPhoneDialer() async {
  final Uri phoneUri = Uri(scheme: 'tel', path: '+919924859611');

  final bool launched = await launchUrl(
    phoneUri,
    mode: LaunchMode.externalApplication,
  );

  if (!launched) {
    debugPrint('Could not launch phone dialer');
  }
}

Future<void> launchEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'mevadameet8301@gmail.com',
    query: Uri.encodeFull('subject=Contact&body=Hello Meet,'),
  );

  final bool launched = await launchUrl(
    emailUri,
    mode: LaunchMode.externalApplication,
  );

  if (!launched) {
    debugPrint('Could not launch email');
  }
}
