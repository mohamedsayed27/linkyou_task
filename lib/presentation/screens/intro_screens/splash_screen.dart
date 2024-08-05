import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkyou_task/core/app_router/screens_name.dart';
import 'package:linkyou_task/core/app_theme/app_colors.dart';
import 'package:linkyou_task/core/app_theme/custom_themes.dart';
import 'package:linkyou_task/core/assets_path/images_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
    _loading();
    super.initState();
  }

  void _loading() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, ScreenName.googleSignInScreen);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagesPath.linkyouLogo,
              height: 108.h,
              width: double.infinity,
            ),
            SizedBox(height:  64.h,),
            FadeTransition(
              opacity: animation,
              child: Text(
                "Provide Everything do You Need to Help Your Business.",
                textAlign: TextAlign.center,
                style: CustomThemes.whiteColorTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
