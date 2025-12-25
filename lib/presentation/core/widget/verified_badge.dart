import 'package:flutter/material.dart';

class VerifiedBadge extends StatelessWidget {
  final bool isVerified;

  const VerifiedBadge({super.key, required this.isVerified});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isVerified
          ? "This charity is verified and disbursable."
          : "Verification pending.",
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isVerified ? Colors.green.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isVerified ? Colors.green : Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isVerified ? Icons.check_circle : Icons.help_outline,
              size: 14,
              color: isVerified ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 4),
            Text(
              isVerified ? 'VERIFIED' : 'PENDING',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: isVerified ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}