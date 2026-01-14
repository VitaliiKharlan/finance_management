import 'package:flutter/material.dart';

import '../../../core/widgets/custom_text_field.dart';

class ProfileSecurityChangePinMainSection extends StatefulWidget {
  const ProfileSecurityChangePinMainSection({super.key});

  @override
  State<ProfileSecurityChangePinMainSection> createState() =>
      _ProfileSecurityChangePinMainSectionState();
}

class _ProfileSecurityChangePinMainSectionState
    extends State<ProfileSecurityChangePinMainSection> {
  final TextEditingController currentPinController = TextEditingController();
  final TextEditingController newPinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    currentPinController.dispose();
    newPinController.dispose();
    confirmPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF2FFF6),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 80),
            CustomTextField(
              controller: currentPinController,
              label: 'Current Pin',
              hint: '●●●●',
              obscureText: _obscurePassword,
              toggleVisibility: () {
                setState(() => _obscurePassword = !_obscurePassword);
              },
            ),
            CustomTextField(
              controller: newPinController,
              label: 'New Pin',
              hint: '●●●●',
              obscureText: _obscurePassword,
              toggleVisibility: () {
                setState(() => _obscurePassword = !_obscurePassword);
              },
            ),
            CustomTextField(
              controller: confirmPinController,
              label: 'Confirm Pin',
              hint: '●●●●',
              obscureText: _obscurePassword,
              toggleVisibility: () {
                setState(() => _obscurePassword = !_obscurePassword);
              },
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
                onPressed: () {},

                child: Text('Change Pin'),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
