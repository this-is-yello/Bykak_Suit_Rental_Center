import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

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
    //오래걸리는 작업 수행
    // Navigator.push(
    //   context, MaterialPageRoute(
    //     builder: (context) => MainPage(),
    //   ),
    // );
    Future.delayed(Duration(seconds: 1), () {
      Get.toNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: style.mainColor,
        child: Center(
          child: Text(
            '로딩중이라네..',
            style: TextStyle(fontSize: 40, fontWeight: style.boldText, color: style.whiteColor),
          ),
        ),
      ),
    );
  }
}