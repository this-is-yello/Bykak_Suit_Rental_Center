import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:bykaksuitrentalcenter/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    Timer(
      const Duration(seconds: 1),
      () => Get.toNamed('/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: style.mainColor,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width < 640
             ? 100
             : MediaQuery.of(context).size.width < 1080
             ? 200
             : 300,
            height: MediaQuery.of(context).size.width < 640
             ? 100
             : MediaQuery.of(context).size.width < 1080
             ? 200
             : 300,
            child: Image.asset(
              'assets/images/bykak_logo_white.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}