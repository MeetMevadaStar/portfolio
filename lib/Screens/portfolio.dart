import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
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
                    backgroundColor: Color(0xFF64FFDA),
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
                      color: Color(0xFF64FFDA),
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
                        style: TextStyle(fontSize: 16, color: Color(0xFF64FFDA)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _glassCard(
                    title: '🚀 Projects',
                    child: Column(
                      children: const [
                        ProjectButton(title: 'Flutter Project', url: 'https://your_flutter_project.com'),
                        ProjectButton(title: 'React Native Project', url: 'https://your_react_native_project.com'),
                        ProjectButton(title: 'Node Project', url: 'https://your_node_project.com'),
                        ProjectButton(title: 'React JS Project', url: 'https://your_react_project.com'),
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
                  const Text('📍 Gujarat, India', style: TextStyle(color: Colors.white)),
                  const Text('📞 +91 12345 67890', style: TextStyle(color: Colors.white)),
                  const Text('✉️ meet.mevada@example.com', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _launchURL('https://linkedin.com/in/yourprofile'),
                        icon: const FaIcon(FontAwesomeIcons.linkedin, color: Color(0xFF64FFDA)),
                      ),
                      IconButton(
                        onPressed: () => _launchURL('https://github.com/yourprofile'),
                        icon: const FaIcon(FontAwesomeIcons.github, color: Color(0xFF64FFDA)),
                      ),
                      IconButton(
                        onPressed: () => _launchURL('https://facebook.com/yourprofile'),
                        icon: const FaIcon(FontAwesomeIcons.facebook, color: Color(0xFF64FFDA)),
                      ),
                      IconButton(
                        onPressed: () => _launchURL('https://instagram.com/yourprofile'),
                        icon: const FaIcon(FontAwesomeIcons.instagram, color: Color(0xFF64FFDA)),
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
                    color: Color(0xFF64FFDA),
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
          foregroundColor: const Color(0xFF64FFDA),
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
