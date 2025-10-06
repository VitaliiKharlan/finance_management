import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileSecurityTermsAndConditionsScreen extends StatelessWidget {
  const ProfileSecurityTermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms And Conditions')),
      body: const Center(child: Text('Terms And Conditions Content')),
    );
  }
}
