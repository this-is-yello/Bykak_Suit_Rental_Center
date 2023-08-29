import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:flutter/foundation.dart';

import 'package:bykaksuitrentalcenter/about_page.dart';
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
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    countVisitor();
  }

  countVisitor() async {
    var visitingNum1;
    var visitingNum2;
    var today = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');

    var allCounting =
        await firestore.collection('visitor').doc('allCounting').get();
    visitingNum1 = await allCounting.get('countAllVisitor');
    var plusAllVisitor = visitingNum1 + 1;
    await firestore
        .collection('visitor')
        .doc('allCounting')
        .update({'countAllVisitor': plusAllVisitor});

    var dayCounting;
    var checkDoc = await firestore.collection('visitor').doc('dayCounting');
    checkDoc.get().then((doc) async {
      if (doc.data()!.containsKey(formatter.format(today))) {
        dayCounting =
            await firestore.collection('visitor').doc('dayCounting').get();
        visitingNum2 = await dayCounting.get(formatter.format(today));
        var plusDayVisitor = visitingNum2 + 1;
        await firestore
            .collection('visitor')
            .doc('dayCounting')
            .update({formatter.format(today): plusDayVisitor});
      } else {
        await firestore
            .collection('visitor')
            .doc('dayCounting')
            .set({formatter.format(today): 1});
      }
    });
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
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
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
