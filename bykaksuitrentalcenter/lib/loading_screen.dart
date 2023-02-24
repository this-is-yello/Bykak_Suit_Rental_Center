import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:bykaksuitrentalcenter/Products_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    __init();
  }

  void __init() async {
    Timer(
      const Duration(seconds: 1),
      () => Get.toNamed('/products'),
    );
    // Future.delayed(Duration(seconds: 1), () {
    //   Get.toNamed('/products');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          color: style.mainColor,
        ),
      ),
    );
  }
}