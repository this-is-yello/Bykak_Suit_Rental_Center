import 'dart:js';

import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:bykaksuitrentalcenter/home_page.dart';
import 'package:bykaksuitrentalcenter/rent/product_detail_page.dart';
import 'package:bykaksuitrentalcenter/account/log_in_page.dart';
import 'package:bykaksuitrentalcenter/account/sign_up_page.dart';
import 'package:bykaksuitrentalcenter/account/my_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lineseed',
      ),
      debugShowCheckedModeBanner: false,
      title: '순양렌탈센터',
      home: HomeScreen(),
    ),
  );

}
