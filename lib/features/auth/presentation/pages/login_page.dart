import 'package:bloc_clean/core/theme/app_pallete.dart';
import 'package:bloc_clean/features/auth/presentation/pages/signup_page.dart';
import 'package:bloc_clean/features/auth/presentation/widgets/auth_field.dart';
import 'package:bloc_clean/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static router() => MaterialPageRoute(builder: (context) => const LoginPage());

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              AuthField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 16),
              AuthField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 24),
              AuthGradientButton(buttonText: 'Sign In', onPressed: () {}),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  // Navigate to Sign Up Page
                  Navigator.push(context, SignUpPage.router());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: AppPallete.gradient1,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
