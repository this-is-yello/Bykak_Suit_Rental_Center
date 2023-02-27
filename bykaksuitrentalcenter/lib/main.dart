import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:bykaksuitrentalcenter/splash_screen.dart';
import 'package:bykaksuitrentalcenter/main_page.dart';
import 'package:bykaksuitrentalcenter/loading_screen.dart';
import 'package:bykaksuitrentalcenter/products_page.dart';

// import 'package:bykaksuitrentalcenter/home_page.dart';
// import 'package:bykaksuitrentalcenter/screens/user/book_history_page.dart';
// import 'package:bykaksuitrentalcenter/screens/rent/product_detail_page.dart';
// import 'package:bykaksuitrentalcenter/screens/rent/search_page.dart';
// import 'package:bykaksuitrentalcenter/screens/account/log_in_page.dart';
// import 'package:bykaksuitrentalcenter/screens/account/my_page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //API 키 값은 외부로 노출되면 안된다. 파일로 키값을 저장하고 gitignore 추가
  // await dotenv.load(fileName: ".env");
  // KakaoSdk.init(nativeAppKey: dotenv.env['kakaoApiKey']);

  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: style.mainColor,
        fontFamily: 'Lineseed',
      ),
      debugShowCheckedModeBanner: false,
      title: '바이각 수트렌탈센터',
      // home: HomeScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/products', page: () => ProductsPage()),
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/loading', page: () => LoadingScreen()),

        // GetPage(name: '/home', page: () => HomeScreen()),
        // GetPage(name: '/login', page: () => LogInScreen()),
        // GetPage(name: '/search', page: () => SearchScreen()),
        // GetPage(name: '/bookHistory', page: () => BookHistoryScreen()),
        // GetPage(name: '/myPage', page: () => MyPageScreen()),
        // GetPage(name: '/productDetail', page: () => ProductDetailScreen()),
      ],
    );
  }
}