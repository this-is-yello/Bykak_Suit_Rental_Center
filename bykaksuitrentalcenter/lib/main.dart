import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:flutter/foundation.dart';

import 'package:bykaksuitrentalcenter/main_page.dart';
import 'package:bykaksuitrentalcenter/products_page.dart';

// import 'package:bykaksuitrentalcenter/home_page.dart';
// import 'package:bykaksuitrentalcenter/screens/user/book_history_page.dart';
// import 'package:bykaksuitrentalcenter/screens/rent/product_detail_page.dart';
// import 'package:bykaksuitrentalcenter/screens/rent/search_page.dart';
// import 'package:bykaksuitrentalcenter/screens/account/log_in_page.dart';
// import 'package:bykaksuitrentalcenter/screens/account/my_page.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  if (kIsWeb) {
    MetaSEO().config();
  }

  //API 키 값은 외부로 노출되면 안된다. 파일로 키값을 저장하고 gitignore 추가
  // await dotenv.load(fileName: ".env");
  // KakaoSdk.init(nativeAppKey: dotenv.env['kakaoApiKey']);

  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      MetaSEO meta = MetaSEO();
      meta.ogTitle(ogTitle: '바이각수트렌탈센터');
      meta.description(description: '바이각 수트렌탈센터는 인천 최초/최대의 정장렌탈 전문샵입니다.');
      meta.keywords(
          keywords:
              '면접정장, 양복대여, 정장대여, 혼주복, 턱시도 대여, 맞춤예복, 바이각수트렌탈센터, 바이각슈트렌탈센터, 바이각렌탈센터');
    }
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: mainColor,
        fontFamily: 'ChosunSm',
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStatePropertyAll(blackColor.withOpacity(0.9)),
          trackColor: MaterialStatePropertyAll(greyColor.withOpacity(0.4)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: '바이각수트렌탈센터',
      // home: HomeScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/products', page: () => ProductsPage()),

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
