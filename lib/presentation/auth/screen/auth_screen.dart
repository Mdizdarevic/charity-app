import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/presentation/auth/notifier/auth_notifier.dart';
import 'package:charity_app/presentation/core/widget/auth_components.dart';

// Modern Notifier for the toggle state
class AuthModeNotifier extends Notifier<bool> {
  @override
  bool build() => true;
  void toggle() => state = !state;
}
final authModeProvider = NotifierProvider<AuthModeNotifier, bool>(AuthModeNotifier.new);

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 4),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent, // We use a container for the design
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            content: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50), // Fully rounded like the image
                border: Border.all(
                  color: const Color(0xFFB82065),
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // The Circular Icon
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFB82065), // Matching the border color
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 15),
                  // The Error Message Text
                  Expanded(
                    child: Text(
                      next.message,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });

    final isSignIn = ref.watch(authModeProvider);
    final authState = ref.watch(authNotifierProvider);

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset('assets/images/camping_image.png', height: 200),
            const SizedBox(height: 20),
            Text(isSignIn ? "Please Sign In" : "Create Account",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),

            CustomAuthField(controller: emailController, hint: "Email"),
            CustomAuthField(controller: passwordController, hint: "Password", isPassword: true),

            if (!isSignIn)
              CustomAuthField(controller: confirmPasswordController, hint: "Confirm Password", isPassword: true),

            const SizedBox(height: 30),

            // Button switches based on AuthNotifier state
            if (authState is AuthLoading)
              const CircularProgressIndicator()
            else
              AuthButton(
                text: isSignIn ? "Sign In" : "Sign Up",
                onPressed: () {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  if (isSignIn) {
                    ref.read(authNotifierProvider.notifier).signIn(email, password);
                  } else {
                    ref.read(authNotifierProvider.notifier).signUp(email, password);
                  }
                },
              ),

            const SizedBox(height: 16),
            TextButton(
              onPressed: () => ref.read(authModeProvider.notifier).toggle(),
              child: Text(isSignIn ? "Don't have an account? Sign Up" : "Already have an account? Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}