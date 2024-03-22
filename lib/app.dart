import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive_layout/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive_layout/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive_layout/web_screen_layout.dart';
import 'package:instagram_clone/utility/colors.dart';

class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: const ResponsiveLayout(
        webScreenLayout: WebScreenLayout(),
        mobileScreenLayout: MobileScreenLayout(),
      ),
    );
  }
}
