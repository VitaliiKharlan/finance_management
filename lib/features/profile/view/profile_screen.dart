import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Profile',
            style: theme.appBarTheme.titleTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),

      body: Container(color: Colors.blue),
    );
  }
}
