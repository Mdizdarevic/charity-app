import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/di.dart';
import 'package:charity_app/presentation/auth/notifier/auth_notifier.dart'; // Import the Notifier
import 'package:charity_app/presentation/core/app_router.dart';
import 'package:charity_app/presentation/core/style/extensions.dart';
import 'package:charity_app/presentation/core/widget/custom_action_button.dart';
import 'package:charity_app/presentation/auth/widget/custom_text_field.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final RegExp REG_EXP_EMAIL = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    // FIX: Watch authNotifierProvider from your di.dart
    final state = ref.watch(authNotifierProvider);

    // FIX: Listen for AuthSuccess and AuthError
    ref.listen<AuthState>(authNotifierProvider, (_, currentState) {
      if (currentState is AuthSuccess) {
        // Ensure AppRouter.mainWrapper matches your router's name
        Navigator.of(context).pushReplacementNamed(AppRouter.mainWrapper);
      }

      if (currentState is AuthError) {
        ErrorSnackBar.show(context, currentState.message);
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView( // Added scroll to prevent overflow
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("assets/images/sign_in_image.png", height: 275),
                const SizedBox(height: 20),
                Text(
                  "Please Sign In",
                  style: context.textSubtitle,
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  placeholder: "Email",
                  controller: _emailController,
                  validator: isEmailValid,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  placeholder: "Password",
                  controller: _passwordController,
                  validator: isPasswordValid,
                ),
                // ... Row with forgot password
                const SizedBox(height: 30),
                CustomActionButton(
                  // FIX: Check for AuthLoading
                  isLoading: state is AuthLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ref.read(authNotifierProvider.notifier).signIn(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                    }
                  },
                ),
                // ... Bottom Sign Up row
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? isEmailValid(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    if (!REG_EXP_EMAIL.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? isPasswordValid(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
}

class ErrorSnackBar {
  static void show(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.colorError,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: context.colorError,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: context.colorError,
          width: 2,
        ),
      ),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      duration: const Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}