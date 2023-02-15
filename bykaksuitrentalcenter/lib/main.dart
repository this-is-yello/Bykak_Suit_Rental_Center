import 'package:bykaksuitrentalcenter/screens/rent/search_page.dart';
import 'package:bykaksuitrentalcenter/screens/user/book_history_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

import 'package:bykaksuitrentalcenter/home_page.dart';
import 'package:bykaksuitrentalcenter/screens/rent/product_detail_page.dart';

import 'package:bykaksuitrentalcenter/screens/account/log_in_page.dart';
import 'package:bykaksuitrentalcenter/screens/account/my_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Lineseed',
      ),
      debugShowCheckedModeBanner: false,
      title: '순양렌탈센터',
      // home: HomeScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/login', page: () => LogInScreen()),
        GetPage(name: '/search', page: () => SearchScreen()),
        GetPage(name: '/bookHistory', page: () => BookHistoryScreen()),
        GetPage(name: '/myPage', page: () => MyPageScreen()),
        GetPage(name: '/productDetail', page: () => ProductDetailScreen()),
      ],
    ),
  );
}
