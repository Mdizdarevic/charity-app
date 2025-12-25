import 'package:flutter/material.dart';
import 'package:charity_app/domain/model/charity.dart';

class CharityItemStyles {
  static IconData getIcon(Charity charity) {

    final String context = "${charity.causeCategory} ${charity.name} ${charity.description}".toLowerCase();

    if (context.contains('animal') || context.contains('pets') || context.contains('wildlife')) {
      return Icons.pets_rounded;
    }
    if (context.contains('environ') || context.contains('nature') || context.contains('eco') || context.contains('ocean')) {
      return Icons.eco_rounded;
    }
    if (context.contains('edu') || context.contains('school') || context.contains('student') || context.contains('youth')) {
      return Icons.school_rounded;
    }
    if (context.contains('health') || context.contains('med') || context.contains('cancer') || context.contains('hospital')) {
      return Icons.favorite_rounded;
    }
    if (context.contains('art') || context.contains('culture') || context.contains('music') || context.contains('museum')) {
      return Icons.palette_rounded;
    }
    if (context.contains('food') || context.contains('hunger') || context.contains('meal')) {
      return Icons.restaurant_rounded;
    }
    if (context.contains('justice') || context.contains('rights') || context.contains('legal')) {
      return Icons.gavel_rounded;
    }
    if (context.contains('science') || context.contains('tech') || context.contains('space')) {
      return Icons.biotech_rounded;
    }

    return Icons.volunteer_activism_rounded;
  }

  static Color getColor(Charity charity) {
    final icon = getIcon(charity);

    if (icon == Icons.pets_rounded) return const Color(0xFFFFB74D); // Orange
    if (icon == Icons.eco_rounded) return const Color(0xFF81C784); // Green
    if (icon == Icons.school_rounded) return const Color(0xFF64B5F6); // Blue
    if (icon == Icons.favorite_rounded) return const Color(0xFFF06292); // Pink
    if (icon == Icons.palette_rounded) return const Color(0xFFBA68C8); // Purple
    if (icon == Icons.restaurant_rounded) return const Color(0xFFE57373); // Red
    if (icon == Icons.gavel_rounded) return const Color(0xFF7986CB); // Indigo (Justice)
    if (icon == Icons.biotech_rounded) return const Color(0xFF4DD0E1); // Cyan (Science/Tech)

    return const Color(0xFF4DB6AC); // Default Teal
  }
}