import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'colour.dart';

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

void showThemedSnackBar(BuildContext context, String message, {bool isError = false}) {
  final backgroundColor = Colors.white.withOpacity(0.05);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      elevation: 8,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: isError ? Colors.redAccent : primaryColour.withOpacity(0.6), width: 1.2),
      ),
      duration: const Duration(seconds: 3),
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: isError ? Colors.redAccent : primaryColour,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    ),
  );
}
