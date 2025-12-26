import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/di.dart'; // IMPORTANT: This gives access to authStateProvider
import 'package:charity_app/presentation/auth/screen/auth_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
            "Profile",
            style: TextStyle(
                color: Colors.black,
              fontWeight: FontWeight.bold
            )
        ),
        centerTitle: true,
      ),
      body: authState.when(
        data: (user) {
          if (user != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFFFDEEF4),
                    child: Icon(Icons.person, size: 50, color: Color(0xFFB82065)),
                  ),
                  const SizedBox(height: 16),
                  Text(user.email ?? "Guest User",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB82065),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      // FIX: Ensure userRepositoryProvider is imported from di.dart
                      onPressed: () => ref.read(userRepositoryProvider).signOut(),
                      child: const Text("Sign Out", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // VIEW: USER IS GUEST (Show Sign In / Register)
            return const AuthScreen();
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Connection Error: $e")),
      ),
    );
  }
}