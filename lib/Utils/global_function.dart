import 'package:url_launcher/url_launcher.dart';

Future<void> launchMap() async {
  const double lat = 23.095826377558456;
  const double lng = 72.66432418841963;
  final Uri googleMapUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lng");

  if (await canLaunchUrl(googleMapUrl)) {
    await launchUrl(googleMapUrl);
  } else {
    throw 'Could not launch map';
  }
}

Future<void> launchPhoneDialer() async {
  final Uri phoneUri = Uri(scheme: 'tel', path: '+919924859611');

  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    throw 'Could not launch phone dialer';
  }
}

Future<void> launchEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'mevadameet8301@gmail.com',
    query: 'subject=Contact&body=Hello Meet,', // optional
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch email';
  }
}
