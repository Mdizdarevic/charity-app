import 'package:charity_app/presentation/favorites/screen/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:charity_app/presentation/charity_search/screen/charity_search_screen.dart';
import 'package:charity_app/presentation/about/screen/about_screen.dart';

class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  // 1. Search is now at index 0
  int _selectedIndex = 0;

  final GlobalKey<NavigatorState> _searchNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        // 2. Updated to check index 0 for the nested navigator
        if (_selectedIndex == 0 && await _searchNavKey.currentState!.maybePop()) {
          return;
        }
      },
      child: Scaffold(
        extendBody: true, // Allows content to scroll behind the transparent bar
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            // 3. Search Navigator moved to the first position
            Navigator(
              key: _searchNavKey,
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(
                  builder: (context) => const CharitySearchScreen(),
                );
              },
            ),

            const FavoritesScreen(),
            const Center(child: Text("Profile")),
            const AboutScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                // Using non-deprecated withValues
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: ClipRRect(
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
              type: BottomNavigationBarType.fixed,
              // Transparent white background
              backgroundColor: Colors.white.withValues(alpha: 0.95),
              selectedItemColor: const Color(0xFFB82065),
              unselectedItemColor: Colors.grey[400],

              iconSize: 32, // Kept the larger icons you liked
              selectedFontSize: 14,
              unselectedFontSize: 14,

              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  activeIcon: Icon(Icons.search_rounded),
                  label: '',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: ''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}