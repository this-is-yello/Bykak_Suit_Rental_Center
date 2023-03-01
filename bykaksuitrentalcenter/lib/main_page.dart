import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_fade/image_fade.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:ui';

import 'package:bykaksuitrentalcenter/splash_screen.dart';
import 'package:bykaksuitrentalcenter/loading_screen.dart';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:opscroll_web/opscroll_web.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

int currentPage = 0;
bool _isLoading = true;
PageController _controller = PageController(
  initialPage: 0,
  keepPage: true,
);

movePage() {
  _controller.animateToPage(
    currentPage,
    duration: Duration(milliseconds: 1000),
    curve: Curves.linearToEaseOut,
  );
}

class _MainPageState extends State<MainPage> {
  // -------------------- menuState() -------------------- //
  menuState(context) {
    if (MediaQuery.of(context).size.width < 1080) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Icon(
              Icons.menu,
              color: style.mainColor,
            ),
            onTap: () => SideSheet.right(
              context: context,
              width: MediaQuery.of(context).size.width * 0.6,
              body: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: style.mainColor,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: style.lightGreyColor,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.question_mark_outlined,
                              color: style.mainColor,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                            Text(
                              'About',
                              style: TextStyle(
                                color: style.blackColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        currentPage = 1;
                        movePage();
                        Get.back();
                      },
                    ),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: style.lightGreyColor,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: style.mainColor,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                            Text(
                              'Product',
                              style: TextStyle(
                                color: style.blackColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        currentPage = 2;
                        movePage();
                        Get.back();
                      },
                    ),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: style.lightGreyColor,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.handshake_outlined,
                              color: style.mainColor,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                            Text(
                              'With',
                              style: TextStyle(
                                color: style.blackColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        currentPage = 3;
                        movePage();
                        Get.back();
                      },
                    ),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: style.lightGreyColor,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              color: style.mainColor,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                            Text(
                              'Contact',
                              style: TextStyle(
                                color: style.blackColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        currentPage = 4;
                        movePage();
                        Get.back();
                      },
                    ),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: style.lightGreyColor,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: style.mainColor,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                            Text(
                              'Location',
                              style: TextStyle(
                                color: style.blackColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        currentPage = 5;
                        movePage();
                        Get.back();
                      },
                    ),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: style.lightGreyColor,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: style.mainColor,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                            Text(
                              'Information',
                              style: TextStyle(
                                color: style.blackColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        currentPage = 6;
                        movePage();
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(padding: EdgeInsets.all(8)),
            InkWell(
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  fontWeight: style.boldText,
                ),
              ),
              onTap: () {
                currentPage = 1;
                movePage();
              },
            ),
            Padding(padding: EdgeInsets.all(12)),
            InkWell(
              child: Text(
                'Products',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  fontWeight: style.boldText,
                ),
              ),
              onTap: () {
                currentPage = 2;
                movePage();
              },
            ),
            Padding(padding: EdgeInsets.all(12)),
            InkWell(
              child: Text(
                'With',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  fontWeight: style.boldText,
                ),
              ),
              onTap: () {
                currentPage = 3;
                movePage();
              },
            ),
            Padding(padding: EdgeInsets.all(12)),
            InkWell(
              child: Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  fontWeight: style.boldText,
                ),
              ),
              onTap: () {
                currentPage = 4;
                movePage();
              },
            ),
            Padding(padding: EdgeInsets.all(12)),
            InkWell(
              child: Text(
                'Location',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  fontWeight: style.boldText,
                ),
              ),
              onTap: () {
                currentPage = 5;
                movePage();
              },
            ),
            Padding(padding: EdgeInsets.all(12)),
            InkWell(
              child: Text(
                'Information',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  fontWeight: style.boldText,
                ),
              ),
              onTap: () {
                currentPage = 6;
                movePage();
              },
            ),
          ],
        ),
      );
    }
  }

  // -------------------- Scaffold -------------------- //
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    return _isLoading
      ? SplashScreen()
      : Stack(
        children: [
          ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: style.whiteColor,
                toolbarHeight: MediaQuery.of(context).size.width < 640
                  ? 56
                  : MediaQuery.of(context).size.width < 1080
                  ? 64
                  : 72,
                title: Center(
                  child: Container(
                    width: style.widgetSize(context),
                    color: style.whiteColor,
                    // child: menuState(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Text(
                            'by覺 렌탈센터',
                            style: TextStyle(
                              fontSize: style.h1FontSize(context),
                              fontWeight: style.boldText,
                              color: style.mainColor,
                            ),
                          ),
                          onTap: () {
                            currentPage = 0;
                              movePage();
                              Get.back();
                          },
                        ),
                        Container(
                          child: menuState(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: PageView(
                controller: _controller,
                scrollDirection: Axis.vertical,
                onPageChanged: (value) {},
                children: [
                  ByKak(),
                  About(),
                  Product(),
                  WithCelebrity(),
                  Contacts(),
                  Location(),
                  Footer(),
                ],
              ),
            );
          },
    ),
        ],
      );
  }
}


// ----------------------------------------------- ByKak ------------------------------------------------------------------
class ByKak extends StatelessWidget {
  const ByKak({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: style.blackColor,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/home_video_2.gif',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '그 날을 위한 자신감, 바이각',
              style: TextStyle(
                fontSize: style.h0FontSize(context),
                fontWeight: style.boldText,
                color: style.whiteColor,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              '바이각 수트렌탈센터는 인천 최초의 정장렌탈 전문샵입니다.',
              style: TextStyle(
                fontSize: style.h5FontSize(context),
                color: style.whiteColor,
              ),
            ),
            Text(
              '웨딩, 면접, 데일리 등 그 날에 걸맞는 다양한 수트를 경험하세요.',
              style: TextStyle(
                fontSize: style.h5FontSize(context),
                color: style.whiteColor,
              ),
            ),
          ],
        ),
      );
    });
  }
}


// ----------------------------------------------- About ------------------------------------------------------------------
aboutRowState(context) {
  if (MediaQuery.of(context).size.width > 1080) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 560,
          // height: 300,
          decoration: BoxDecoration(
            color: style.blackColor,
            image: DecorationImage(
              image: AssetImage(
                'assets/images/home_video_3.gif',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'By 覺 D-Day Rental Suit',
              style: TextStyle(
                fontSize: style.h0FontSize(context),
                fontWeight: style.boldText,
                color: style.blackColor,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
              style: TextStyle(
                fontSize: style.h5FontSize(context),
                color: style.blackColor,
              ),
            ),
            Text(
              'sed do eiusmod tempor incididunt ut labore et dolore',
              style: TextStyle(
                fontSize: style.h5FontSize(context),
                color: style.blackColor,
              ),
            ),
          ],
        ),
      ],
    );
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: style.blackColor,
            image: DecorationImage(
              image: AssetImage(
                'assets/images/home_video_3.gif',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: style.paddingSize(context),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'By 覺 D-Day Rental Suit',
              style: TextStyle(
                fontSize: style.h1FontSize(context),
                fontWeight: style.boldText,
                color: style.blackColor,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
              style: TextStyle(
                fontSize: style.h6FontSize(context),
                color: style.blackColor,
              ),
            ),
            Text(
              'sed do eiusmod tempor incididunt ut labore et dolore',
              style: TextStyle(
                fontSize: style.h6FontSize(context),
                color: style.blackColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: style.whiteColor,
        ),
        child: Center(
          child: Container(
            width: style.widgetSize(context),
            child: aboutRowState(context)
          ),
        ),
      );
    });
  }
}


// ----------------------------------------------- Product ------------------------------------------------------------------
class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        color: style.whiteColor,
        child: Center(
          child: Container(
            width: style.widgetSize(context),
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product',
                  style: TextStyle(
                    fontSize: style.h1FontSize(context),
                    fontWeight: style.boldText,
                    color: style.mainColor,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  width: style.widgetSize(context),
                  height: MediaQuery.of(context).size.width < 640
                      ? 450
                      : MediaQuery.of(context).size.width < 1080
                      ? 460
                      : 480,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: false,
                    itemCount: MediaQuery.of(context).size.width < 640
                        ? 4
                        : MediaQuery.of(context).size.width < 1080
                        ? 6
                        : 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width < 640
                          ? 2
                          : MediaQuery.of(context).size.width < 1080
                          ? 3
                          : 5,
                      childAspectRatio: 1 / 1.2,
                      mainAxisSpacing: style.paddingSize(context),
                      crossAxisSpacing: style.paddingSize(context),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: style.whiteColor,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [style.boxShadows],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: ImageFade(
                              image: AssetImage(
                                'assets/images/products/product_(${index}).jpg'
                              ),
                              fit: BoxFit.cover,
                              errorBuilder: (context, exception) => Icon(Icons.error),
                              placeholder: Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(
                                    color: style.mainColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Color.fromARGB(0, 0, 0, 0),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      iconSize: 30,
                                      alignment: Alignment.center,
                                      icon: Icon(
                                        Icons.close,
                                        size: 30,
                                        color: style.whiteColor,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                                content: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: InteractiveViewer(
                                          child: Image.asset(
                                            'assets/images/products/product_(${index}).jpg',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: style.c1BoxSize(context),
                                      height: style.c1BoxSize(context),
                                      child: PinchUp(),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Column(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_up,
                            size: style.h1FontSize(context),
                            color: style.mainColor,
                          ),
                          Text(
                            '전체보기',
                            style: TextStyle(
                              fontSize: style.h2FontSize(context),
                              color: style.mainColor,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Get.toNamed('/products');
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class PinchUp extends StatefulWidget {
  const PinchUp({super.key});

  @override
  State<PinchUp> createState() => _PinchUpState();
}

class _PinchUpState extends State<PinchUp> {
  bool _showPinchUp = true;

  showPinchUp() {
    if(_showPinchUp == true) {
      return style.c1BoxSize(context);
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        _showPinchUp = false;
      });
    });

    return _showPinchUp ? Container(
      width: style.c1BoxSize(context),
      height: style.c1BoxSize(context),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: style.greyColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Image.asset(
        'assets/images/icon_pinchUp.png',
        fit: BoxFit.contain,
      ),
    ) : Container();
  }
}


// ----------------------------------------------- With.. ------------------------------------------------------------------
class WithCelebrity extends StatelessWidget {
  const WithCelebrity({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        color: style.whiteColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'With by覺',
                style: TextStyle(
                  fontSize: style.h1FontSize(context),
                  fontWeight: style.boldText,
                  color: style.mainColor,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Container(
                width: style.widgetSize(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/with_celebrity.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}


// ----------------------------------------------- Location ------------------------------------------------------------------
class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        color: style.whiteColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: TextStyle(
                  fontSize: style.h1FontSize(context),
                  fontWeight: style.boldText,
                  color: style.mainColor,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Container(
                width: style.widgetSize(context),
                child: InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/rental_center_location.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () async {
                    final url = Uri.parse(
                      'https://map.naver.com/v5/entry/place/1943136667?placePath=%2Fhome%3Fentry=plt&c=15,0,0,0,dh',
                    );
                    if (await canLaunchUrl(url)) {
                      launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 4)),
              Text(
                '※ 지도를 클릭하면 네이버 지도로 연결합니다.',
                style: TextStyle(
                  fontSize: style.h5FontSize(context),
                  fontWeight: style.boldText,
                  color: style.mainColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '바이각 수트렌탈센터',
                  style: TextStyle(
                    fontSize: style.h3FontSize(context),
                    color: style.blackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text(
                  '(22102) 인천 미추홀구 숙골로 43번길 158-19 3층',
                  style: TextStyle(
                    fontSize: style.h4FontSize(context),
                    color: style.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}


// ----------------------------------------------- Contacts ------------------------------------------------------------------
class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        color: style.whiteColor,
        child: Center(
          child: Container(
            width: style.widgetSize(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact',
                  style: TextStyle(
                    fontSize: style.h1FontSize(context),
                    fontWeight: style.boldText,
                    color: style.mainColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Container(
                  width: style.widgetSize(context),
                  height: MediaQuery.of(context).size.width < 640
                      ? 360
                      : 180,
                  child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width < 640
                            ? 2
                            : 4,
                        childAspectRatio: 1 / 1,
                        mainAxisSpacing: style.paddingSize(context),
                        crossAxisSpacing: style.paddingSize(context),
                    ),
                    children: [
                      InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/logo_kakao.png',
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                '플러스 친구',
                                style: TextStyle(
                                  fontSize: style.h4FontSize(context),
                                  color: style.greyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () async {
                          final url =
                              Uri.parse('http://pf.kakao.com/_UxoHxbT/chat');
                          if (await canLaunchUrl(url)) {
                            launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/logo_talktalk.png',
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                '네이버 문의',
                                style: TextStyle(
                                  fontSize: style.h4FontSize(context),
                                  color: style.greyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () async {
                          final url = Uri.parse(
                              'http://talk.naver.com/wcc3zi?frm=mnmb&frm=nmb_detail#nafullscreen');
                          if (await canLaunchUrl(url)) {
                            launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/logo_naver.png',
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                '네이버 예약',
                                style: TextStyle(
                                  fontSize: style.h4FontSize(context),
                                  color: style.greyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () async {
                          final url = Uri.parse(
                              'https://booking.naver.com/booking/13/bizes/839741');
                          if (await canLaunchUrl(url)) {
                            launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                      InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/logo_phone.png',
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                '070-7893-3059',
                                style: TextStyle(
                                  fontSize: style.h5FontSize(context),
                                  color: style.greyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () async {
                          final url = Uri.parse('tel:+82 070 7893 3059');
                          if (await canLaunchUrl(url)) {
                            launchUrl(url, mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(8),
                // ),
                Center(
                  child: Container(
                    child: Text(
                      '저희 매장은 월요일부터 토요일, 오전10시부터 오후7시까지 운영합니다. 자세한 사항은 문의해 주시면 안내해 드리도록 하겠습니다.',
                      style: TextStyle(
                        fontSize: style.h4FontSize(context),
                        color: style.blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}


// ----------------------------------------------- Footer ------------------------------------------------------------------
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          // image: ,
          color: style.mainColor,
        ),
        child: Center(
          child: Container(
            width: style.widgetSize(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'by覺 렌탈센터',
                    style: TextStyle(
                      fontSize: style.h1FontSize(context),
                      fontWeight: style.boldText,
                      color: style.whiteColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Image.asset('assets/images/logo_kakao.png',
                            fit: BoxFit.contain, scale: 1.5),
                        onTap: () async {
                          final url = Uri.parse('http://pf.kakao.com/_UxoHxbT');
                          if (await canLaunchUrl(url)) {
                            launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                      InkWell(
                        child: Image.asset('assets/images/logo_naver_blog.png',
                            fit: BoxFit.contain, scale: 1.5),
                        onTap: () async {
                          final url =
                              Uri.parse('https://blog.naver.com/kimjuhyeon_');
                          if (await canLaunchUrl(url)) {
                            launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                      InkWell(
                        child: Image.asset('assets/images/logo_instagram.png',
                            fit: BoxFit.contain, scale: 1.5),
                        onTap: () async {
                          final url = Uri.parse(
                              'https://www.instagram.com/kimjuhyeon_by_kak/');
                          if (await canLaunchUrl(url)) {
                            launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                      InkWell(
                        child: Image.asset('assets/images/logo_youtube.png',
                            fit: BoxFit.contain, scale: 1.5),
                        onTap: () async {
                          final url = Uri.parse(
                              'https://www.youtube.com/@user-sk6bq7pt7p/featured');
                          if (await canLaunchUrl(url)) {
                            launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '(주) 데시그너 대표이사 : 김주현',
                            style: TextStyle(
                              color: style.whiteColor,
                              fontSize: style.h4FontSize(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '사업자등록번호 : 720-86-02241',
                            style: TextStyle(
                              color: style.whiteColor,
                              fontSize: style.h4FontSize(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '인천광역시 미추홀구 석정로 200',
                            style: TextStyle(
                              color: style.whiteColor,
                              fontSize: style.h4FontSize(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '우편번호 : 22102',
                            style: TextStyle(
                              color: style.whiteColor,
                              fontSize: style.h4FontSize(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Copyright ⓒ 2023 by Designer',
                            style: TextStyle(
                              color: style.whiteColor,
                              fontSize: style.h4FontSize(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
