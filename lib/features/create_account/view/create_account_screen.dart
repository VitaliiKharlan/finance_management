import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/router.dart';
import '../../auth/auth_bloc/auth_bloc.dart';
import '../../auth/auth_bloc/auth_event.dart';
import '../../auth/auth_bloc/auth_state.dart';
import '../../auth/customer.dart';
import '../../auth/user_entity.dart';
import '../widgets/custom_text_field.dart';

@RoutePage()
class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    final fullName = _fullNameController.text.trim();
    final email = _emailController.text.trim();
    final mobile = _mobileNumberController.text.trim();
    final dob = _dobController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    context.read<AuthBloc>().add(
      RegisterCustomerRequested(
        user: UserEntity(
          id: '',
          name: fullName,
          email: email,
          mobileNumber: mobile,
          dateOfBirth: dob,
        ),
        customer: Customer(
          id: '',
          name: fullName,
          email: email,
          mobileNumber: mobile,
        ),
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00D09E),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            Future.microtask(() {
              context.pushRoute(const HomeRoute());
            });
          }

          if (state is AuthFailure) {
            Future.microtask(() {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            });
          }
          return SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Create Account',
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
                          CustomTextField(
                            label: 'Full Name',
                            hint: 'example@example.com',
                            controller: _fullNameController,
                          ),
                          CustomTextField(
                            label: 'Email',
                            hint: 'example@example.com',
                            controller: _emailController,
                          ),
                          CustomTextField(
                            label: 'Mobile Number',
                            hint: '+ 123 456 789',
                            controller: _mobileNumberController,
                          ),
                          CustomTextField(
                            label: 'Date Of Birth',
                            hint: 'DD / MM /YYY',
                            controller: _dobController,
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
                            controller: _passwordController,
                          ),
                          CustomTextField(
                            label: 'Confirm Password',
                            hint: '●●●●●●●●',
                            obscureText: _obscureConfirmPassword,
                            toggleVisibility: () {
                              setState(
                                () =>
                                    _obscureConfirmPassword =
                                        !_obscureConfirmPassword,
                              );
                            },
                            controller: _confirmPasswordController,
                          ),
                          const SizedBox(height: 8),
                          const Text.rich(
                            TextSpan(
                              text: 'By continuing, you agree to\n',
                              children: [
                                TextSpan(
                                  text: 'Terms of Use',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'Privacy Policy.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                              style: TextStyle(fontSize: 14),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
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
                              onPressed: _onSignUpPressed,

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(fontSize: 12),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.pushRoute(const WelcomeRoute());
                                },
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
