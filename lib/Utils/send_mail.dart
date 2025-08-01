import 'package:http/http.dart' as http;
import 'dart:convert';

import 'constant.dart';

Future<void> sendEmailUsingEmailJS({
  required String name,
  required String email,
  required String message,
}) async {
  const serviceId = 'service_u33dvpc';
  const templateId = 'template_oqmsddj';
  const userId = 'XVRkf658IG7plSlEj'; // Public key from EmailJS

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {
      'origin': 'http://localhost',
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'to_name': name,
        'from_name': email,
        'message': 'Name : ${name}\nEmail : ${email}\nmessage : ${message}',
        "reply_to": reply_to
      },
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Email sending failed: ${response.body}');
  }
}
