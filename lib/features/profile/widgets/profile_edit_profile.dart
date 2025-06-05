import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_images.dart';
import '../profile_bloc/profile_bloc.dart';

class ProfileEditProfileView extends StatelessWidget {
  const ProfileEditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00D09E),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap:
                        () =>
                            context.read<ProfileBloc>().add(ProfileViewEvent()),
                    child: SvgPicture.asset(AppIcons.iconProfileBringBack),
                  ),
                  const Spacer(),
                  const Text(
                    'Edit My Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF093030),
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.iconHomeNotifications),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF1FFF3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(AppImages.userAvatar),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'John Smith',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF0E3E3E),
                        ),
                      ),
                      const Text(
                        'ID: 25030024',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF093030),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildTextField(label: 'Username', value: 'John Smith'),
                      _buildTextField(label: 'Phone', value: '+44 555 5555 55'),
                      _buildTextField(
                        label: 'Email Address',
                        value: 'example@example.com',
                      ),
                      const SizedBox(height: 12),
                      _buildSwitch(label: 'Push Notifications'),
                      _buildSwitch(label: 'Turn Dark Theme'),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00D09E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Update Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: value,
          filled: true,
          fillColor: const Color(0xFFEFFCF3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSwitch({required String label}) {
    return SwitchListTile(value: true, onChanged: (_) {}, title: Text(label));
  }
}
