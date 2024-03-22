import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/screens/login_screen.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreen()
    );
  }
}
