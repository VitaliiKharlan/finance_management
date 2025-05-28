import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_icons.dart';
import '../../auth/auth_bloc/auth_bloc.dart';
import '../../auth/auth_bloc/auth_state.dart';
import '../../create_account/widgets/custom_text_field.dart';

@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _hasShownError = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    context.read<AuthBloc>().add(
      LoginRequested(email: email, password: password),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is AuthFailure && !_hasShownError) {
          _hasShownError = true;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is Authenticated || state is AuthSuccess) {
          emailController.clear();
          passwordController.clear();
          context.pushRoute(const HomeRoute());
        } else {
          _hasShownError = false;
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Scaffold(
          backgroundColor: const Color(0xFF00D09E),
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF2FFF6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 20,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 80),
                          CustomTextField(
                            label: 'Username Or Email',
                            hint: 'example@example.com',
                            controller: emailController,
                          ),
                          CustomTextField(
                            label: 'Password',
                            hint: '●●●●●●●●',
                            obscureText: _obscurePassword,
                            toggleVisibility: () {
                              setState(
                                    () => _obscurePassword = !_obscurePassword,
                              );
                            },
                            controller: passwordController,
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: 148,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00C19C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed:
                                  isLoading
                                      ? null
                                      : () => _onLoginPressed(context),
                              child:
                              isLoading
                                      ? const CircularProgressIndicator(
                                        color: Colors.black,
                                      )
                                      : const Text(
                                        'Log In',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 148,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE9F9EF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Use ',
                                style: const TextStyle(color: Colors.black87),
                                children: [
                                  TextSpan(
                                    text: 'Fingerprint',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(text: ' To Access'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Center(child: Text('or sign up with')),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppIcons.iconWelcomeFacebook,
                                width: 32,
                                height: 32,
                              ),
                              SizedBox(width: 24),
                              SvgPicture.asset(
                                AppIcons.iconWelcomeGoogle,
                                width: 32,
                                height: 32,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style: const TextStyle(color: Colors.black87),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                      color: Colors.blue.shade700,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            context.pushRoute(
                                              const CreateAccountRoute(),
                                            );
                                          },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
