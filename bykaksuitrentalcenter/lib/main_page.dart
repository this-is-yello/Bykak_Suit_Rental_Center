import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:scrolls_to_top/scrolls_to_top.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:opscroll_web/opscroll_web.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    productCheck();
  }

  // PageController controller = PageController(
  //   initialPage: 0,
  // );

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: style.whiteColor,
            title: Center(
              child: MainAppBar(),
            ),
          ),
          // body: PageView(
          //   controller: controller,
          //   scrollDirection: Axis.vertical,
          //   children: [
          //     Home(),
          //     ByKak(),
          //     Product(),
          //     Contacts(),
          //   ],
          // ),
          body: OpscrollWeb(
            scrollDirection: Axis.vertical,
            scrollSpeed: Duration(milliseconds: 500,),
            isTouchScrollingActive: true,
            isFloatingButtonActive: true,
            floatingButtonBackgroundColor: style.mainColor,
            scrollCurve: Curves.easeInOut,
            floatingButtonSplashColor: style.mainColor,
            pageController: PageController(
              initialPage: 0,
            ),
            onePageChildren: [
              Home(),
              ByKak(),
              Product(),
              Contacts(),
              Footer(),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   child: Icon(Icons.arrow_upward, color: style.mainColor,),
          //   backgroundColor: style.whiteColor,
          //   onPressed: () {},
          // ),
        );
      },
    );
  }
}

class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  // ----------------------------------------------- MenuState ------------------------------------------------------------------
  menuState(context) {
    if (MediaQuery.of(context).size.width < 640) {
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
                      // hoverColor: Color.fromARGB(0, 0, 0, 0),
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
                            Icons.shopping_cart_outlined,
                            color: style.mainColor,
                          ),
                          Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          Text(
                            'PRODUCTS',
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
                            Icons.phone,
                            color: style.mainColor,
                          ),
                          Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          Text(
                            'CONTACTS',
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
            )),
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
                'Contents',
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
  Widget build(BuildContext context) {
    return Container(
      width: style.widgetSize(context),
      color: style.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Text(
              '순양 렌탈센터',
              style: TextStyle(
                color: style.mainColor,
                fontWeight: style.boldText,
              ),
            ),
            onTap: () {},
          ),
          Container(
            child: menuState(context),
          ),
        ],
      ),
    );
  }
}


// ----------------------------------------------- Home ------------------------------------------------------------------
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            // image: ,
            // color: ,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '자신감의 시작, 바이각',
                style: TextStyle(
                  fontSize: style.h1FontSize(context),
                  fontWeight: style.boldText,
                  color: style.mainColor,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}


// ----------------------------------------------- ByKak ------------------------------------------------------------------
class ByKak extends StatelessWidget {
  const ByKak({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            // image: ,
            // color: ,
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
                      fontSize: style.h1FontSize(context),
                      fontWeight: style.boldText,
                      color: style.mainColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16,),
                  child: Container(
                    width: style.widgetSize(context),
                    child: Column(
                      children: [
                        Text(
                          '바이각 수트렌탈센터는 인천 최초의 정장렌탈 전문샵입니다.',
                          style: TextStyle(
                            fontSize: style.h5FontSize(context),
                            color: style.blackColor
                          ),
                        ),
                        Text(
                          '웨딩, 면접, 데일리 등 그 날에 걸맞는 다양한 수트를 경험하실 수 있습니다.',
                          style: TextStyle(
                            fontSize: style.h5FontSize(context),
                            color: style.blackColor
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}


// ----------------------------------------------- Product ------------------------------------------------------------------
var productShop;
var productImage;

productCheck() async {
  var checkProduct = await style.firestore.collection('product').get();

  // 반복문 처리 해야합니다.
  productShop = checkProduct.docs[1]['shop'];
  productImage = checkProduct.docs[1]['productImage'];
}

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.trackpad,
                PointerDeviceKind.stylus
              }
            ),
            child: Center(
              child: Container(
                width: style.widgetSize(context),
                height: double.infinity,
                child: GridView.builder(
                  itemCount: 24,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width < 640 
                      ? 2
                      : MediaQuery.of(context).size.width < 1080
                      ? 3
                      : 4,
                    childAspectRatio: 1 / 1.5,
                    mainAxisSpacing: style.paddingSize(context),
                    crossAxisSpacing: style.paddingSize(context),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: style.mainColor,
                          border: Border.all(
                            color: style.greyColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            '$productImage',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onHover: (value) {},
                      onTap: () {},
                    );
                  }
                ),
              ),
            ),
          ),
          // child: Row(
          //   children: [
          //     ScrollConfiguration(
          //       behavior: ScrollConfiguration.of(context).copyWith(
          //         dragDevices: {
          //           PointerDeviceKind.mouse,
          //           PointerDeviceKind.touch,
          //           PointerDeviceKind.trackpad,
          //         }
          //       ),
          //       child: Expanded(
          //         child: ListView.builder(
          //           itemCount: 20,
          //           scrollDirection: Axis.horizontal,
          //           itemBuilder: (context, index) {
          //             return Center(
          //               child: Container(
          //                 width: 300,
          //                 height: 400,
          //                 margin: EdgeInsets.only(right: 16),
          //                 // color: style.mainColor,
          //                 child: Container(
          //                   decoration: BoxDecoration(
          //                     border: Border.all(color: style.lightGreyColor, width: 2),
          //                     borderRadius: BorderRadius.circular(8),
          //                   ),
          //                   child: InkWell(
          //                     child: Container(
          //                       // width: double.infinity,
          //                       // height: 400,
          //                       decoration: BoxDecoration(
          //                         color: style.mainColor,
          //                         borderRadius: BorderRadius.circular(8),
          //                       ),
          //                       child: ClipRRect(
          //                         borderRadius: BorderRadius.circular(8),
          //                         child: Image.network(
          //                           '$productImage',
          //                           fit: BoxFit.cover,
          //                         ),
          //                       ),
          //                     ),
          //                     onHover: (value) {},
          //                     onTap: () {},
          //                   ),
          //                 ),
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.only(left: 16),
          //       child: Icon(Icons.arrow_forward_ios_outlined),
          //     ),
          //   ],
          // ),
        );
      }
    );
  }
}


// ----------------------------------------------- Contacts ------------------------------------------------------------------
class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            // image: ,
            // color: ,
          ),
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
                  Padding(padding: EdgeInsets.all(20),),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Column(
                            children: [
                              Image.asset('assets/images/logo_Kakao_talk.png', fit: BoxFit.contain,),
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
                          onTap: () {},
                        ),
                        InkWell(
                          child: Column(
                            children: [
                              Image.asset('assets/images/logo_talktalk.png', fit: BoxFit.contain,),
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
                          onTap: () {},
                        ),
                        InkWell(
                          child: Column(
                            children: [
                              Image.asset('assets/images/logo_naver.png', fit: BoxFit.contain,),
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
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(12),),
                  Center(
                    child: InkWell(
                      child: Column(
                        children: [
                          Image.asset('assets/images/logo_phone.png', fit: BoxFit.contain,),
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
                      onTap: () {},
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20),),
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
      }
    );
  }
}


// ----------------------------------------------- Footer ------------------------------------------------------------------
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
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
                      '순양렌탈센터',
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
                          child: Image.asset('assets/images/logo_kakao_talk.png', fit: BoxFit.contain, scale: 1.5),
                          onTap: () {},
                        ),
                        InkWell(
                          child: Image.asset('assets/images/logo_naver_blog.png', fit: BoxFit.contain, scale: 1.5),
                          onTap: () {},
                        ),
                        InkWell(
                          child: Image.asset('assets/images/logo_instagram.png', fit: BoxFit.contain, scale: 1.5),
                          onTap: () {},
                        ),
                        InkWell(
                          child: Image.asset('assets/images/logo_youtube.png', fit: BoxFit.contain, scale: 1.5),
                          onTap: () {},
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
                              '우편번호 : 000000',
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
      }
    );
  }
}