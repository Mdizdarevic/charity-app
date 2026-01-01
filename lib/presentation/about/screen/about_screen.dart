import 'package:charity_app/presentation/about/widget/about_bento_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:charity_app/presentation/about/widget/about_bento_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final String _fbiUrl = 'https://www.ic3.gov/';

  Future<void> _reportScam() async {
    final Uri url = Uri.parse(_fbiUrl);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $_fbiUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F2),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 140,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/charity_splash_image.png',
                  height: 65,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                const Text(
                  "Cherry",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB82065),
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            AboutBentoCard(
              title: "\$96 Million",
              content: "Scammers exploit our natural desire to help others using AI, fake identities, and realistic-looking donation sites. In 2024, the FBI reported nearly \$96 million in losses to fraudulent charities. Cherry was built to stop this.",
              lottieAsset: 'assets/animations/thief.json',
              color: Colors.white,
              textColor: Colors.black87,
              isMainBrandCard: false,
            ),
            const SizedBox(height: 15),
            AboutBentoCard(
              title: "What is a 'Cherry'?",
              content: "A 'Cherry' is more than just a charity, it's a promise. Every organization marked with our Cherry icon has been IRS-verified as a legitimate 501(c)(3) entity. When you pick a Cherry, you're picking a scam-free path to making an impact.",
              lottieAsset: 'assets/animations/badge.json',
              color: const Color(0xFFB82065).withValues(alpha: 0.1),
              textColor: const Color(0xFFB82065),
              isMainBrandCard: false,
            ),
            const SizedBox(height: 30),
            const Text(
              "Spotted a fake fundraiser?",
              style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: _reportScam,
                icon: const Icon(Icons.gavel_rounded, color: Colors.white),
                label: const Text(
                  "Report Scam to the FBI",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB82065),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                ),
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}