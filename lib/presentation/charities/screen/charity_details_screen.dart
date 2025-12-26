import 'package:flutter/material.dart';
import 'package:charity_app/domain/model/charity.dart';
import 'package:charity_app/presentation/core/style/charity_item_styles.dart';
import 'package:charity_app/domain/favorites/favorites_manager.dart'; // Import added here
import 'package:url_launcher/url_launcher.dart';

class CharityDetailScreen extends StatelessWidget {
  final Charity charity;

  const CharityDetailScreen({super.key, required this.charity});

  @override
  Widget build(BuildContext context) {
    final color = CharityItemStyles.getColor(charity);
    final icon = CharityItemStyles.getIcon(charity);

    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(charity.causeCategory.toUpperCase(),
            style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold)),
        actions: [
          ValueListenableBuilder<List<Charity>>(
            valueListenable: FavoritesManager.favoriteCharities,
            builder: (context, favorites, child) {
              final isFav = FavoritesManager.isFavorite(charity);
              return IconButton(
                iconSize: 32,
                onPressed: () {
                  FavoritesManager.toggleFavorite(charity);
                },
                icon: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut,
                  tween: Tween(begin: 1.0, end: isFav ? 1.3 : 1.0),
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? const Color(0xFFB82065) : Colors.grey,
                      ),
                    );
                  },
                ),
              );;
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100, height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Icon(icon, color: color, size: 50),
              ),
            ),
            const SizedBox(height: 24),

            Text(charity.name,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("EIN: ${charity.ein}",
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 24),

            const Text("About this Charity",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(charity.description,
                style: TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.5)),

            const SizedBox(height: 40),

            if (charity.profileUrl.isNotEmpty)
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB82065),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () => launchUrl(Uri.parse(charity.profileUrl)),
                  child: const Text("Visit Website",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}