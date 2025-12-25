import 'package:flutter/material.dart';

class AboutBentoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color color;
  final Color textColor;
  final bool isMainBrandCard;

  const AboutBentoCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    required this.color,
    required this.textColor,
    this.isMainBrandCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: textColor, size: 32),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: isMainBrandCard
                  ? Colors.white.withValues(alpha: 0.9)
                  : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}