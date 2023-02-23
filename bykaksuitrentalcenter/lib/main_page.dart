import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:opscroll_web/opscroll_web.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/rendering.dart';

import 'package:bykaksuitrentalcenter/loading_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

var _scroll = ScrollController();
var nowHeight = _scroll.position.pixels;

class _MainPageState extends State<MainPage> {
  menuState(context) {
    if (MediaQuery.of(context).size.width < 1080) {
      return InkWell(
        child: Icon(
          Icons.menu,
          color: style.mainColor,
        ),
        onTap: () => SideSheet.right(
          context: context,
          width: MediaQuery.of(context).size.width * 0.7,
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
                          Icons.home_outlined,
                          color: style.mainColor,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                        Text(
                          'ByKak',
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
                    setState(() {
                      _scroll.position.pixels == 0;
                    });
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
                          'Products',
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
                    var allHeight = MediaQuery.of(context).size.height * 6;

                    setState(() {
                      nowHeight == allHeight / 3;
                      print(allHeight);
                      print(nowHeight);
                    });
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
                  onTap: () {},
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
                          'Contacts',
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
                  onTap: () {},
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
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: Row(
          children: [
            InkWell(
              child: Text(
                'ByKak',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  // fontWeight: style.boldText,
                ),
              ),
              onTap: () {},
            ),
            Padding(padding: EdgeInsets.all(8)),
            InkWell(
              child: Text(
                'Products',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  // fontWeight: style.boldText,
                ),
              ),
              onTap: () {},
            ),
            Padding(padding: EdgeInsets.all(8)),
            InkWell(
              child: Text(
                'Location',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  // fontWeight: style.boldText,
                ),
              ),
              onTap: () {},
            ),
            Padding(padding: EdgeInsets.all(8)),
            InkWell(
              child: Text(
                'Contents',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  // fontWeight: style.boldText,
                ),
              ),
              onTap: () {},
            ),
            Padding(padding: EdgeInsets.all(8)),
            InkWell(
              child: Text(
                'Information',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  // fontWeight: style.boldText,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      print(_scroll.position.pixels);
      if (_scroll.position.pixels == 0) {
        _scroll.addListener(() {
          setState(() {
            _scroll.position.pixels == 2000;
          });
        });
      }
      // if (_scroll.position.pixels == _scroll.position.maxScrollExtent &&
      //     yes == true) {
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: style.whiteColor,
            title: Center(
              child: Container(
                width: style.widgetSize(context),
                color: style.whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Text(
                        'by覺 렌탈센터',
                        style: TextStyle(
                          color: style.mainColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                      onTap: () {
                        Get.toNamed('/');
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
            // controller: controller,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            onPageChanged: (value) {},
            children: [
              Home(),
              ByKak(),
              Product(),
              Contacts(),
              Location(),
              Footer(),
            ],
          ),
          // body: OpscrollWeb(
          //   scrollDirection: Axis.vertical,
          //   scrollSpeed: Duration(milliseconds: 500,),
          //   isTouchScrollingActive: true,
          //   isFloatingButtonActive: true,
          //   floatingButtonBackgroundColor: style.mainColor,
          //   scrollCurve: Curves.easeInOut,
          //   floatingButtonSplashColor: style.mainColor,
          //   pageController: PageController(
          //     initialPage: 0,
          //   ),
          //   onePageChildren: [
          //     Home(),
          //     ByKak(),
          //     Product(),
          //     Contacts(),
          //     Location(),
          //     Footer(),
          //   ],
          // ),
          // body: ListView(
          //   controller: _scroll,
          //   children: [
          //     Home(),
          //     ByKak(),
          //     Product(),
          //     Contacts(),
          //     Location(),
          //     Footer(),
          //   ],
          // ),
        );
      },
    );
  }
}

// ----------------------------------------------- Home ------------------------------------------------------------------
class Home extends StatelessWidget {
  const Home({super.key});

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
              'assets/images/home_video_3.gif',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              // '자신감의 시작, 바이각',
              '',
              style: TextStyle(
                fontSize: style.h0FontSize(context),
                fontWeight: style.boldText,
                color: style.whiteColor,
              ),
            ),
          ],
        ),
      );
    });
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
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: style.blackColor,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/home_video_2.gif',
            ),
            fit: BoxFit.cover,
            // colorFilter: ColorFilter.mode(
            //   style.blackColor.withOpacity(0.8),
            //   BlendMode.modulate,
            // ),
          ),
        ),
        child: Container(
          width: style.widgetSize(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'By 覺 D-Day Rental Suit ',
                  style: TextStyle(
                    fontSize: style.h0FontSize(context),
                    fontWeight: style.boldText,
                    color: style.whiteColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Container(
                  width: style.widgetSize(context),
                  child: Column(
                    children: [
                      Text(
                        '바이각 수트렌탈센터는 인천 최초의 정장렌탈 전문샵입니다.',
                        style: TextStyle(
                            fontSize: style.h5FontSize(context),
                            color: style.whiteColor),
                      ),
                      Text(
                        '웨딩, 면접, 데일리 등 그 날에 걸맞는 다양한 수트를 경험하세요.',
                        style: TextStyle(
                            fontSize: style.h5FontSize(context),
                            color: style.whiteColor),
                      ),
                    ],
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

// ----------------------------------------------- Product ------------------------------------------------------------------
List hoverShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0),
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0),
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0),
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0),
  ),
];

List _nHover = [false, false, false, false];

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
                      ? 240
                      : MediaQuery.of(context).size.width < 1080
                          ? 240
                          : 320,
                  child: GridView.builder(
                      physics: ScrollPhysics(),
                      itemCount: MediaQuery.of(context).size.width < 640
                          ? 2
                          : MediaQuery.of(context).size.width < 1080
                              ? 3
                              : 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width < 640
                            ? 2
                            : MediaQuery.of(context).size.width < 1080
                                ? 3
                                : 4,
                        childAspectRatio: 1 / 1.2,
                        mainAxisSpacing: style.paddingSize(context),
                        crossAxisSpacing: style.paddingSize(context),
                      ),
                      itemBuilder: (context, index) {
                        List productBox = [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [hoverShadow[index]],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/images/white.png'),
                                image: AssetImage(
                                    'assets/images/products/product_${index}.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [hoverShadow[index]],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/images/white.png'),
                                image: AssetImage(
                                    'assets/images/products/product_${index}.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [hoverShadow[index]],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/images/white.png'),
                                image: AssetImage(
                                    'assets/images/products/product_${index}.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [hoverShadow[index]],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/images/white.png'),
                                image: AssetImage(
                                    'assets/images/products/product_${index}.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ];
                        return InkWell(
                          child: productBox[index],
                          onHover: (value) {
                            // bool _isHover = false;
                            setState(() {
                              _nHover[index] = value;
                            });
                            //print("Hover? ---> ${_nHover[index]}");
                            if (_nHover[index] == true) {
                              hoverShadow[index] = style.boxShadows;
                            } else {
                              hoverShadow[index] = BoxShadow(
                                color: Colors.grey.withOpacity(0),
                                blurRadius: 4,
                                offset: Offset(0, 0),
                              );
                            }
                          },
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
                                  content: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: InteractiveViewer(
                                        child: Image.asset(
                                          'assets/images/products/product_${index}.jpg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }),
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
                        Get.toNamed('/splash');
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
              // 지도누르면 네이버 지도 연결하기 https://map.naver.com/v5/entry/place/1943136667?placePath=%2Fhome%3Fentry=plt&c=15,0,0,0,dh
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
                        'https://map.naver.com/v5/entry/place/1943136667?placePath=%2Fhome%3Fentry=plt&c=15,0,0,0,dh');
                    if (await canLaunchUrl(url)) {
                      launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '바이각 수트렌탈센터',
                  style: TextStyle(
                      fontSize: style.h3FontSize(context),
                      color: style.blackColor),
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
                      color: style.blackColor),
                ),
              ),
              Text(
                '제물포역 2번출구에서 도보 3분',
                style: TextStyle(
                    fontSize: style.h4FontSize(context),
                    color: style.blackColor),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/logo_Kakao_talk.png',
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
                              'https://booking.naver.com/booking/6/bizes/151182?area=pll');
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
                  padding: EdgeInsets.all(12),
                ),
                Center(
                  child: InkWell(
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
                                fontSize: style.h3FontSize(context),
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
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Center(
                  child: Container(
                    child: Text(
                      '바이각 렌탈센터는 월요일부터 토요일, 오전 10시부터 오후 7시까지 운영합니다. 문의해 주시면 정성을 다해 안내해 드리도록 하겠습니다.',
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
                        child: Image.asset('assets/images/logo_kakao_talk.png',
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
                            '사업자등록번호 : 000-00-00000',
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
