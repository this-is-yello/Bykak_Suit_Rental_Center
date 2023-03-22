import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_fade/image_fade.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter/gestures.dart';
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

int i = 0;
int currentPage = 0;
bool _isLoading = true;
var shopPic;
List hoverState = [false, false, false];

hoverOpacity(n) {
  if (hoverState[n] == false) {
    return 0;
  } else if (hoverState[n] == true) {
    return 1;
  }
}

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

List aboutShopPics = [
  'assets/images/shops/shop_1.png',
  'assets/images/shops/shop_2.png',
  'assets/images/shops/shop_3.png',
  'assets/images/shops/shop_4.png',
  'assets/images/shops/shop_5.png',
  'assets/images/shops/shop_6.png',
  'assets/images/shops/shop_7.png',
  'assets/images/shops/shop_8.png',
  'assets/images/shops/shop_9.png',
  'assets/images/shops/shop_10.png',
  'assets/images/shops/shop_1.png',
];
List lookPics = [
  'assets/images/lookbooks/lookbook_1.png',
  'assets/images/lookbooks/lookbook_2.png',
  'assets/images/lookbooks/lookbook_3.png',
  'assets/images/lookbooks/lookbook_4.png',
  'assets/images/lookbooks/lookbook_5.png',
  'assets/images/lookbooks/lookbook_6.png',
  'assets/images/lookbooks/lookbook_7.png',
  'assets/images/lookbooks/lookbook_8.png',
  'assets/images/lookbooks/lookbook_9.png',
  // 'assets/images/lookbooks/lookbook_10.png',
];


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
              color: mainColor,
            ),
            onTap: () => SideSheet.right(
              context: context,
              width: MediaQuery.of(context).size.width * 0.6,
              body: Container(
                height: double.infinity,
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              color: mainColor,
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
                                  color: lightGreyColor,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.question_mark_outlined,
                                  color: mainColor,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4),
                                ),
                                Text(
                                  'About',
                                  style: TextStyle(
                                    fontWeight: boldText,
                                    color: blackColor,
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
                                  color: lightGreyColor,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.collections_outlined,
                                  color: mainColor,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4),
                                ),
                                Text(
                                  'LookBook',
                                  style: TextStyle(
                                    fontWeight: boldText,
                                    color: blackColor,
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
                                  color: lightGreyColor,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: mainColor,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4),
                                ),
                                Text(
                                  'Product',
                                  style: TextStyle(
                                    fontWeight: boldText,
                                    color: blackColor,
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
                                  color: lightGreyColor,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.handshake_outlined,
                                  color: mainColor,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4),
                                ),
                                Text(
                                  'With',
                                  style: TextStyle(
                                    fontWeight: boldText,
                                    color: blackColor,
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
                                  color: lightGreyColor,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: mainColor,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4),
                                ),
                                Text(
                                  'Location',
                                  style: TextStyle(
                                    fontWeight: boldText,
                                    color: blackColor,
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
                                  color: lightGreyColor,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: mainColor,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4),
                                ),
                                Text(
                                  'Information',
                                  style: TextStyle(
                                    fontWeight: boldText,
                                    color: blackColor,
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
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: mainColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: Center(
                          child: Text(
                            '예약하기',
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              fontWeight: boldText,
                              color:mainColor
                            ),
                          ),
                        ),
                      ),
                      onTap: () async {
                        Get.back();
                        final url = Uri.parse(
                          'https://booking.naver.com/booking/13/bizes/839741',
                        );
                        if (await canLaunchUrl(url)) {
                          launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        }
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
                  color: mainColor,
                  fontWeight: boldText,
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
                'LookBook',
                style: TextStyle(
                  fontSize: 16,
                  color: mainColor,
                  fontWeight: boldText,
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
                'Products',
                style: TextStyle(
                  fontSize: 16,
                  color: mainColor,
                  fontWeight: boldText,
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
                'With',
                style: TextStyle(
                  fontSize: 16,
                  color: mainColor,
                  fontWeight: boldText,
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
                  color: mainColor,
                  fontWeight: boldText,
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
                  color: mainColor,
                  fontWeight: boldText,
                ),
              ),
              onTap: () {
                currentPage = 6;
                movePage();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: InkWell(
                child: Container(
                  width: 120,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: mainColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      '예약하기',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: boldText,
                        color:mainColor
                      ),
                    ),
                  ),
                ),
                onTap: () async {
                  final url = Uri.parse(
                    'https://booking.naver.com/booking/13/bizes/839741',
                  );
                  if (await canLaunchUrl(url)) {
                    launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  // -------------------- Scaffold -------------------- //
  @override
  Widget build(BuildContext context) {
    if (i >= 9) {
      Future.delayed(
        Duration(seconds: i >= 10 ? 0 : 4), () {
          setState(() {
            i = 0;
          });
        }
      );
      shopPic = aboutShopPics[i];
      print('$i, $shopPic');
    } else {
      Future.delayed(
        Duration(seconds: 4), () {
          setState(() {
            i++;
          });
        }
      );
      shopPic = aboutShopPics[i];
      print('$i, $shopPic');
    }

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whiteColor,
            toolbarHeight: MediaQuery.of(context).size.width < 640
              ? 56
              : MediaQuery.of(context).size.width < 1080
              ? 64
              : 72,
            title: Center(
              child: Container(
                width: widgetSize(context),
                color: whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Text(
                        'by覺 렌탈센터',
                        style: TextStyle(
                          fontSize: h1FontSize(context),
                          color: mainColor,
                        ),
                      ),
                      // ),
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
          body: Container(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                PageView(
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (value) {},
                  children: [
                    ByKak(),
                    About(),
                    LookBook(),
                    Product(),
                    WithCelebrity(),
                    Location(),
                    Footer(),
                  ],
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8, bottom: 16),
                            child: Opacity(
                              opacity: hoverOpacity(0),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '카카오톡 문의',
                                  style: TextStyle(
                                    fontWeight: boldText,
                                    color: mainColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(right: 16, bottom: 12),
                              width: floatingBtnSize(context),
                              height: floatingBtnSize(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [boxShadows],
                                color: kakaoColor,
                              ),
                              child: Image.asset(
                                'assets/images/logos/logo_kakao_talk_white.png',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            onHover: (value) {
                              if (value == true) {
                                setState(() {
                                  hoverState[0] = true;
                                });
                              } else {
                                setState(() {
                                  hoverState[0] = false;
                                });
                              }
                            },
                            onTap: () async {
                              final url = Uri.parse(
                                'http://pf.kakao.com/_WExlxixj/chat',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8, bottom: 16),
                            child: Opacity(
                              opacity: hoverOpacity(1),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '네이버 톡톡 문의',
                                  style: TextStyle(
                                    fontWeight: boldText,
                                    color: mainColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(right: 16, bottom: 12),
                              width: floatingBtnSize(context),
                              height: floatingBtnSize(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [boxShadows],
                                color: naverColor,
                              ),
                              child: Image.asset(
                                'assets/images/logos/logo_talktalk_white.png',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            onHover: (value) {
                              if (value == true) {
                                setState(() {
                                  hoverState[1] = true;
                                });
                              } else {
                                setState(() {
                                  hoverState[1] = false;
                                });
                              }
                            },
                            onTap: () async {
                              final url = Uri.parse(
                                'http://talk.naver.com/wcc3zi?frm=mnmb&frm=nmb_detail#nafullscreen',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8, bottom: 16),
                            child: Opacity(
                              opacity: hoverOpacity(2),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '070-7893-3059',
                                  style: TextStyle(
                                    fontWeight: boldText,
                                    color: mainColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(right: 16, bottom: 16),
                              width: floatingBtnSize(context),
                              height: floatingBtnSize(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [boxShadows],
                                color: blackColor,
                              ),
                              child: Image.asset(
                                'assets/images/logos/logo_phone_white.png',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            onHover: (value) {
                              if (value == true) {
                                setState(() {
                                  hoverState[2] = true;
                                });
                              } else {
                                setState(() {
                                  hoverState[2] = false;
                                });
                              }
                            },
                            onTap: () async {
                              final url = Uri.parse(
                              'tel:070 7893 3059',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
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
          color: blackColor,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/home_video_2.gif',
            ),
            opacity: 0.7,
            fit: BoxFit.cover,
          ),
        ),
      );
    });
  }
}


// ----------------------------------------------- About ------------------------------------------------------------------
class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  indexChange(index) {
    setState(() {
      i = index;
      shopPic = aboutShopPics[i];
    });
    print(i);
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: Center(
          child: Container(
            width: widgetSize(context),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: h1FontSize(context),
                      fontWeight: boldText,
                      color: mainColor,
                    ),
                  ),
                ),
                MediaQuery.of(context).size.width < 1080 ?
                Column (
                  children: [
                    Container(
                      width: widgetSize(context),
                      child: ImageFade(
                        image: AssetImage(
                          '$shopPic',
                        ),
                        fit: BoxFit.fitHeight,
                        errorBuilder: (context, exception) => Icon(Icons.error),
                        placeholder: Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: mainColor,
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                        duration: Duration(milliseconds: 500),
                        syncDuration: Duration(milliseconds: 500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: paddingSize(context)),
                    ),
                    Container(
                      width: widgetSize(context),
                      height: MediaQuery.of(context).size.width < 640
                      ? 80
                      : 120,
                      child: GridView.builder(
                        itemCount: 10, //item 개수
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 16 / 9,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: ImageFade(
                              image: AssetImage(
                                aboutShopPics[index]
                              ),
                              fit: BoxFit.cover,
                              errorBuilder: (context, exception) => Icon(Icons.error),
                              placeholder: Center(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: mainColor,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              indexChange(index);
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            '그 날을 위한 자신감, 바이각',
                            style: TextStyle(
                              fontSize: h1FontSize(context),
                              fontWeight: boldText,
                              color: blackColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: paddingSize(context),
                              bottom: paddingSize(context)
                            ),
                            child: Text(
                              '바이각 수트렌탈센터는 100 평대의\n인천 최초/최대의 정장렌탈 전문샵입니다.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: h4FontSize(context),
                                // fontWeight: boldText,
                                color: blackColor,
                              ),
                            ),
                          ),
                          Text(
                            '웨딩, 혼주복, 면접, 데일리등으로\n그 날에 걸맞은 다양한 수트를 경험할 수 있습니다.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: h4FontSize(context),
                              // fontWeight: boldText,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 550,
                          height: 350,
                          child: ImageFade(
                            image: AssetImage(
                              '$shopPic',
                            ),
                            fit: BoxFit.fitHeight,
                            errorBuilder: (context, exception) => Icon(Icons.error),
                            placeholder: Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: mainColor,
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                            duration: Duration(milliseconds: 500),
                            syncDuration: Duration(milliseconds: 500),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '그 날을 위한 자신감, 바이각',
                                style: TextStyle(
                                  fontSize: h1FontSize(context),
                                  fontWeight: boldText,
                                  color: blackColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: paddingSize(context),
                                  bottom: paddingSize(context)
                                ),
                                child: Text(
                                  '바이각 수트렌탈센터는 100 평대의\n인천 최초/최대의 정장렌탈 전문샵입니다.',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: h4FontSize(context),
                                    // fontWeight: boldText,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              Text(
                                '웨딩, 혼주복, 면접, 데일리등으로\n그 날에 걸맞은 다양한 수트를 경험할 수 있습니다.',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: h4FontSize(context),
                                  // fontWeight: boldText,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.only(top: 16),
                      child: GridView.builder(
                        itemCount: 10, //item 개수
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 10,
                          childAspectRatio: 16 / 9,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: ImageFade(
                              image: AssetImage(
                                aboutShopPics[index]
                              ),
                              fit: BoxFit.cover,
                              errorBuilder: (context, exception) => Icon(Icons.error),
                              placeholder: Center(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: mainColor,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              indexChange(index);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}


// ----------------------------------------------- LookBook ------------------------------------------------------------------
class LookBook extends StatefulWidget {
  const LookBook({super.key});

  @override
  State<LookBook> createState() => _LookBookState();
}

class _LookBookState extends State<LookBook> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: Center(
          child: Container(
            width: widgetSize(context),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LookBook',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontWeight: boldText,
                    color: mainColor,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  width: widgetSize(context),
                  height: lookPicHeight(context),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch,
                        PointerDeviceKind.trackpad,
                      }
                    ),
                    child: Scrollbar(
                      scrollbarOrientation: ScrollbarOrientation.bottom,
                      controller: _scrollController,
                      radius: Radius.circular(4),
                      thumbVisibility: true,
                      trackVisibility: true,
                      thickness: 12,
                      hoverThickness: 16,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                height: lookPicHeight(context),
                                margin: EdgeInsets.only(right: 20),
                                child: ImageFade(
                                  image: AssetImage(
                                    lookPics[index],
                                  ),
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, exception) => Icon(Icons.error),
                                  placeholder: Padding(
                                    padding: const EdgeInsets.all(56),
                                    child: Center(
                                      child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: CircularProgressIndicator(
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 500),
                                  syncDuration: Duration(milliseconds: 500),
                                ),
                              );
                            },
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: whiteColor,
                            size: 40,
                            shadows: [boxShadows],
                          )
                        ],
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
        color: whiteColor,
        child: Center(
          child: Container(
            width: widgetSize(context),
            height: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontWeight: boldText,
                    color: mainColor,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  width: widgetSize(context),
                  height: MediaQuery.of(context).size.width < 640
                      ? 400
                      : MediaQuery.of(context).size.width < 1080
                      ? 420
                      : 570,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: false,
                    itemCount: MediaQuery.of(context).size.width < 640
                        ? 4
                        : MediaQuery.of(context).size.width < 1080
                        ? 6
                        : 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width < 640
                          ? 2
                          : MediaQuery.of(context).size.width < 1080
                          ? 3
                          : 4,
                      childAspectRatio: 1 / 1.2,
                      mainAxisSpacing: paddingSize(context),
                      crossAxisSpacing: paddingSize(context),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          width: widgetSize(context),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(8),
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
                                    color: mainColor,
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
                                        color: whiteColor,
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
                                      width: c1BoxSize(context),
                                      height: c1BoxSize(context),
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
                            size: h1FontSize(context),
                            color: mainColor,
                          ),
                          Text(
                            '전체보기',
                            style: TextStyle(
                              fontSize: h3FontSize(context),
                              fontWeight: boldText,
                              color: mainColor,
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
      return c1BoxSize(context);
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 650), () {
      setState(() {
        _showPinchUp = false;
      });
    });

    return _showPinchUp ? Container(
      width: c1BoxSize(context),
      height: c1BoxSize(context),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Image.asset(
        'assets/images/icon_pinchUp.png',
        fit: BoxFit.contain,
      ),
    ) : Container();
  }
}


// ----------------------------------------------- With ------------------------------------------------------------------
class WithCelebrity extends StatelessWidget {
  const WithCelebrity({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: whiteColor,
        child: Center(
          child: Container(
            width: widgetSize(context),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'With by覺',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontWeight: boldText,
                    color: mainColor,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/with_celebrity.png',
                    fit: BoxFit.contain,
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



// ----------------------------------------------- Location ------------------------------------------------------------------
class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: whiteColor,
        child: Center(
          child: Container(
            width: widgetSize(context),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontWeight: boldText,
                    color: mainColor,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                InkWell(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            '바이각 수트렌탈센터',
                            style: TextStyle(
                              fontSize: h2FontSize(context),
                              color: blackColor,
                              fontWeight: boldText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            '※지도 클릭 시 네이버 지도로 연결합니다.',
                            style: TextStyle(
                              fontSize: h6FontSize(context),
                              fontWeight: boldText,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        bottom: 8,
                      ),
                      child: Text(
                        '(22102) 인천 미추홀구 숙골로 43번길 158-19 3층',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          color: blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 2,
                  color: greyColor,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4,),
                        child: Text(
                          '오시는 길',
                          style: TextStyle(
                            fontSize: h2FontSize(context),
                            color: blackColor,
                            fontWeight: boldText,
                          ),
                        ),
                      ),
                      Text(
                        '제물포역 2번출구 도보 1분',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          color: blackColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4,),
                        child: Text(
                          '[37502] 제물포역(스마트타운 방면) 버스정류장 도보 3분',
                          style: TextStyle(
                            fontSize: h5FontSize(context),
                            color: blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  color: greyColor,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4,),
                            child: Text(
                              '주차안내',
                              style: TextStyle(
                                fontSize: h2FontSize(context),
                                color: blackColor,
                                fontWeight: boldText,
                              ),
                            ),
                          ),
                          Text(
                            '김주현바이각 제물포 본점 / 제물포북부역 공영주차장 2시간 무료',
                            style: TextStyle(
                              fontSize: h5FontSize(context),
                              color: blackColor,
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 4,),
                          //   child: Text(
                          //     '제물포북부역 공영주차장 2시간 무료',
                          //     style: TextStyle(
                          //       fontSize: h5FontSize(context),
                          //       color: blackColor,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
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
          color: mainColor,
        ),
        child: Center(
          child: Container(
            width: widgetSize(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: InkWell(
                    child: Text(
                      'by覺 렌탈센터',
                      style: TextStyle(
                        fontSize: h1FontSize(context),
                        color: whiteColor,
                      ),
                    ),
                    onTap: () {
                      currentPage = 0;
                        movePage();
                        Get.back();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Image.asset(
                          'assets/images/logos/logo_kakao_talk.png',
                          fit: BoxFit.contain,
                          scale: 1.5,
                        ),
                        onTap: () async {
                          final url = Uri.parse(
                            'http://pf.kakao.com/_WExlxixj',
                          );
                          if (await canLaunchUrl(url)) {
                            launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                      ),
                      InkWell(
                        child: Image.asset(
                          'assets/images/logos/logo_blog.png',
                          fit: BoxFit.contain,
                          scale: 1.5,
                        ),
                        onTap: () async {
                          final url = Uri.parse(
                            'https://blog.naver.com/kimjuhyeon_',
                          );
                          if (await canLaunchUrl(url)) {
                            launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                      ),
                      InkWell(
                        child: Image.asset(
                          'assets/images/logos/logo_instagram.png',
                          fit: BoxFit.contain,
                          scale: 1.5,
                        ),
                        onTap: () async {
                          final url = Uri.parse(
                            'https://instagram.com/bykak_rental?igshid=YmMyMTA2M2Y=',
                          );
                          if (await canLaunchUrl(url)) {
                            launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                      ),
                      InkWell(
                        child: Image.asset(
                          'assets/images/logos/logo_youtube.png',
                          fit: BoxFit.contain,
                          scale: 1.5,
                        ),
                        onTap: () async {
                          final url = Uri.parse(
                            'https://www.youtube.com/channel/UChLYML6MnztkeOYdtdAQqaw',
                          );
                          if (await canLaunchUrl(url)) {
                            launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
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
                            '(주) 데시그너',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '사업자등록번호 : 720-86-02241',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '인천광역시 미추홀구 숙골로 43번길 158-19 3층',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '우편번호 : 22102',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '전화번호 : 070-7893-3059',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Copyright ⓒ 2023 by Designer',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
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
