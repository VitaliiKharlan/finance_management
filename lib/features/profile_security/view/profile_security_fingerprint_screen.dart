import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileSecurityFingerprintScreen extends StatelessWidget {
  const ProfileSecurityFingerprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fingerprint')),
      body: const Center(child: Text('Fingerprint Content')),
    );
  }
}
