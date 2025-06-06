import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../create_account/widgets/custom_text_field.dart';

class ProfileEditProfileView extends StatefulWidget {
  const ProfileEditProfileView({super.key});

  @override
  State<ProfileEditProfileView> createState() => _ProfileEditProfileViewState();
}

class _ProfileEditProfileViewState extends State<ProfileEditProfileView> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();

  bool pushNotificationsEnabled = true;
  bool darkThemeEnabled = false;

  @override
  void dispose() {
    userNameController.dispose();
    phoneController.dispose();
    emailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 24, top: 4, right: 24, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Settings',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.lettersAndIcons,
            ),
          ),

          const SizedBox(height: 16),
          CustomTextField(
            label: 'Username',
            hint: 'John Smith',
            controller: userNameController,
          ),
          CustomTextField(
            label: 'Phone',
            hint: 'example@example.com',
            controller: phoneController,
          ),
          CustomTextField(
            label: 'Email Address',
            hint: 'example@example.com',
            controller: emailAddressController,
          ),
          SettingsToggleCard(
            title: 'Push Notifications',
            value: true,
            onChanged: (value) {
              setState(() => pushNotificationsEnabled = value);
            },
          ),
          SettingsToggleCard(
            title: 'Turn Dark Theme',
            value: true,
            onChanged: (value) {
              setState(() => darkThemeEnabled = value);
            },
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainGreen,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(172, 36),
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Text(
                'Update Profile',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsToggleCard extends StatelessWidget {
  const SettingsToggleCard({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.lettersAndIcons,
            ),
          ),
          Transform(
            transform: Matrix4.diagonal3Values(1.2, 1.0, 1.0),
            alignment: Alignment.center,
            child: CupertinoSwitch(
              value: value,
              onChanged: onChanged,
              activeTrackColor: AppColors.mainGreen,
            ),
          ),
        ],
      ),
    );
  }
}
