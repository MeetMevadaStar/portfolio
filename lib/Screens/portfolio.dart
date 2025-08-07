import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Utils/colour.dart';
import '../Utils/constant.dart';
import '../Utils/global_function.dart';
import 'contect_form.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0e0f1a),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: primaryColour,
                    child: CircleAvatar(
                      radius: 56,
                      backgroundImage: AssetImage('assets/images/meet.jpg'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Meet Mevada',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 10, color: Colors.white24, offset: Offset(1, 1))],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Flutter Developer | 2.5+ Years Experience',
                    style: TextStyle(
                      fontSize: 18,
                      color: primaryColour,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _glassCard(
                    title: 'About Me',
                    child: const Text(
                      'Currently at MKS Digitech\n'
                      'Formerly at Feeltech Solution (merged with MKS Digitech)\n\n'
                      '• Developed Android, iOS, and Web Apps\n'
                      '• Deployed apps to Play Store, App Store & Firebase Hosting\n'
                      '• Team Management & Client Communication\n'
                      '• Also delivered React Native apps',
                      style: TextStyle(height: 1.6, fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _glassCard(
                    title: '📦 Published Flutter Package',
                    child: InkWell(
                      onTap: () => _launchURL('https://pub.dev/packages/whatsapp_field'),
                      child: const Text(
                        '→ whatsapp_field on pub.dev',
                        style: TextStyle(fontSize: 16, color: primaryColour),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _glassCard(
                    title: '🚀 Projects',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ProjectButton(title: 'Flutter Project', url: 'https://github.com/MeetMevadaStar'),
                        ProjectButton(title: 'React Native Project', url: 'https://github.com/MeetMevadaStar'),
                        ProjectButton(title: 'Node Project', url: 'https://github.com/MeetMevadaStar'),
                        ProjectButton(title: 'React JS Project', url: 'https://github.com/MeetMevadaStar'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _glassCard(
                    title: '🤝 Get In Touch',
                    child: Column(
                      children: const [
                        Text(
                          "I'm always open to discussing new opportunities,\ncollaborating on projects, or just having a chat about Flutter development.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        ContactForm(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Divider(thickness: 1, color: Colors.white30),
                  const SizedBox(height: 16),
                  InkWell(onTap: launchMap, child: const Text('📍 Ahmedabad, Gujarat, India', style: TextStyle(color: Colors.white))),
                  InkWell(onTap: launchPhoneDialer, child: Text('📞 ${mobileNumber}', style: TextStyle(color: Colors.white))),
                  InkWell(onTap: launchEmail, child: Text('✉️ ${emailAddress}', style: TextStyle(color: Colors.white))),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _launchURL('https://in.linkedin.com/in/meet-mevada-041532246'),
                        icon: const FaIcon(FontAwesomeIcons.linkedin, color: primaryColour),
                      ),
                      IconButton(
                        onPressed: () => _launchURL('https://github.com/MeetMevadaStar'),
                        icon: const FaIcon(FontAwesomeIcons.github, color: primaryColour),
                      ),
                      IconButton(
                        onPressed: () => _launchURL('https://www.facebook.com/meet.mevada.319'),
                        icon: const FaIcon(FontAwesomeIcons.facebook, color: primaryColour),
                      ),
                      IconButton(
                        onPressed: () => _launchURL('https://www.instagram.com/meet_mevada_/'),
                        icon: const FaIcon(FontAwesomeIcons.instagram, color: primaryColour),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _glassCard({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.white.withOpacity(0.05), Colors.white.withOpacity(0.02)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColour,
                  ),
                ),
                const SizedBox(height: 12),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}

class ProjectButton extends StatelessWidget {
  final String title;
  final String url;
  const ProjectButton({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: primaryColour,
          backgroundColor: Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        onPressed: () async {
          if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
            throw 'Could not launch $url';
          }
        },
        icon: const Icon(Icons.open_in_new),
        label: Text(title),
      ),
    );
  }
}
