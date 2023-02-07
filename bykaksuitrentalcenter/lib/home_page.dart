import 'dart:html';

import 'package:bykaksuitrentalcenter/screens/rent/search_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bykaksuitrentalcenter/screens/rent/product_detail_page.dart';
import 'package:bykaksuitrentalcenter/screens/account/log_in_page.dart';
import 'package:bykaksuitrentalcenter/screens/account/my_page.dart';
import 'package:bykaksuitrentalcenter/screens/user/book_history_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    return _isLoading ? Center(
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          color: style.mainColor,
        ),
      ),
    ) : Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: style.mainColor,
        // iconTheme: IconThemeData(color: style.whiteColor),
        title: Center(
          child: MediaQuery.of(context).size.width < 640
              ? PhoneAppBar()
              : WideAppBar(),
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Center(child: MainBanner()),
          ),
          Container(
            child: Center(child: FirstContents()),
          ),
          Container(
            child: Center(child: SecondContents()),
          ),
          Container(
            child: Center(child: ThirdContents()),
          ),
          Container(
            child: Center(child: FourthContents()),
          ),
          Container(
            child: Center(child: Footer()),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------- AppBar ---------------------------------------------------
// Phone-AppBar
class PhoneAppBar extends StatelessWidget {
  const PhoneAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // 검색, 예약내역 나타내기
            },
          ),
          Text('순양 렌탈센터',
            style: TextStyle(
              color: style.whiteColor,
              fontWeight: style.boldText,
            ),
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // 로그인 상태 확인해서 마이페이지 또는 로그인 화면
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyPageScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Wide-AppBar
class WideAppBar extends StatelessWidget {
  const WideAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('순양 렌탈센터',
              style: TextStyle(
                  color: style.whiteColor, fontWeight: style.boldText)),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),),);
                  },
                ),
                TextButton(
                  child: Text(
                    '예약내역',
                    style: TextStyle(
                        fontSize: 16,
                        color: style.whiteColor,
                        fontWeight: style.boldText),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookHistoryScreen(),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: Text(
                    '마이페이지',
                    style: TextStyle(
                        fontSize: 16,
                        color: style.whiteColor,
                        fontWeight: style.boldText),
                  ),
                  onPressed: () {
                    // 로그인 상태 확인해서 마이페이지 또는 로그인 화면
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen(),),);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPageScreen(),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: Text(
                    '로그인', //혹은 로그아웃
                    style: TextStyle(
                        fontSize: 16,
                        color: style.whiteColor,
                        fontWeight: style.boldText),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------- Main-Banner ---------------------------------------------------
class MainBanner extends StatelessWidget {
  const MainBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return CarouselSlider(
        options: CarouselOptions(
          height: 40.w,
          viewportFraction: 1,
          autoPlay: true,
        ),
        items: [
          Container(
            width: 100.w,
            height: 40.w,
            color: style.mainColor,
            child: Image.asset('assets/images/banner2.jpg', fit: BoxFit.cover),
          ),
        ],
      );
    });
  }
}

// -------------------------------------------------- Contents ---------------------------------------------------
// Contents-1
class FirstContents extends StatelessWidget {
  const FirstContents({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: style.widgetSize(context),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(style.paddingSize(context))),
              InkWell(
                child: Container(
                  width: 100.w,
                  height: 90,
                  padding: EdgeInsets.all(style.paddingSize(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('대여기간'),
                      Padding(
                        padding: EdgeInsets.only(
                          top: style.paddingSize(context),
                        ),
                      ),
                      Text('YY.MM.DD - YY.MM.DD'),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: style.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [style.boxShadows],
                  ),
                ),
                onTap: () {},
              ),
              Padding(padding: EdgeInsets.all(8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: InkWell(
                      child: Container(
                        height: 90,
                        padding: EdgeInsets.all(style.paddingSize(context)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('대여형태'),
                            Padding(
                              padding: EdgeInsets.only(
                                top: style.paddingSize(context),
                              ),
                            ),
                            Text('예복대여')
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: style.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [style.boxShadows],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Flexible(
                    fit: FlexFit.tight,
                    child: InkWell(
                      child: Container(
                        height: 90,
                        padding: EdgeInsets.all(style.paddingSize(context)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('상담시간'),
                            Padding(
                              padding: EdgeInsets.only(
                                top: style.paddingSize(context),
                              ),
                            ),
                            Text('YY.MM.DD / HH.MM')
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: style.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [style.boxShadows],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(8)),
              InkWell(
                child: Container(
                  width: 100.w,
                  height: 60,
                  child: Center(
                    child: Text(
                      '검색',
                      style: TextStyle(
                          color: style.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: style.mainColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [style.boxShadows],
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      );
    });
  }
}

// Contents-2
class SecondContents extends StatefulWidget {
  const SecondContents({super.key});

  @override
  State<SecondContents> createState() => _SecondContentsState();
}

class _SecondContentsState extends State<SecondContents> {
  boxSize(context) {
    if(MediaQuery.of(context).size.width < 640) {
      return 160;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 200;
    } else {
      return 300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: style.widgetSize(context),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(style.paddingSize(context))),
            Container(
              padding: EdgeInsets.all(style.paddingSize(context)),
              child: Text(
                '인기상품',
                style: TextStyle(
                  color: style.blackColor,
                  fontSize: style.h2FontSize(context),
                  fontWeight: style.boldText,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(style.paddingSize(context))),
            Container(
              width: style.widgetSize(context),
              padding: EdgeInsets.all(16),
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.5,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  // aspectRatio: 1 / 1.5
                ),
                items: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: style.lightGreyColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      child: Column(
                        children: [
                          Container(
                            width: boxSize(context),
                            height: boxSize(context),
                            decoration: BoxDecoration(
                              color: style.mainColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                          ),
                          Container(
                            width: boxSize(context),
                            height: 100,
                            padding: EdgeInsets.all(style.paddingSize(context)),
                            decoration: BoxDecoration(
                              color: style.whiteColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '상품명',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context),
                                    color: style.blackColor,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(2)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '대여샵',
                                      style: TextStyle(
                                        fontSize: style.h4FontSize(context),
                                        color: style.greyColor),
                                      ),
                                    Text(
                                      '50000원',
                                      style: TextStyle(
                                        fontSize: style.h4FontSize(context),
                                        color: style.mainColor,
                                        fontWeight: style.boldText,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

// Contents-3
class ThirdContents extends StatelessWidget {
  const ThirdContents({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: style.widgetSize(context),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(style.paddingSize(context))),
            Container(
              padding: EdgeInsets.all(style.paddingSize(context)),
              child: Text(
                '패키지 상품',
                style: TextStyle(
                    color: style.blackColor,
                    fontSize: style.h2FontSize(context),
                    fontWeight: style.boldText),
              ),
            ),
            Padding(padding: EdgeInsets.all(style.paddingSize(context))),
            Container(
              width: style.widgetSize(context),
              height: style.homeGridHeight(context),
              padding: EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: 6,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.5,
                  crossAxisCount:
                      MediaQuery.of(context).size.width < 1080 ? 2 : 3,
                  mainAxisSpacing: style.paddingSize(context),
                  crossAxisSpacing: style.paddingSize(context),
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: style.lightGreyColor,
                          width: 2
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: style.mainColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(style.paddingSize(context)),
                            decoration: BoxDecoration(
                              color: style.whiteColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('패키지 명',
                                    style: TextStyle(
                                        fontSize: style.h4FontSize(context),
                                        color: style.blackColor)),
                                Padding(padding: EdgeInsets.all(2)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '대여샵',
                                      style: TextStyle(
                                        fontSize: style.h4FontSize(context),
                                        color: style.greyColor,
                                      ),
                                    ),
                                    Text('500000원',
                                      style: TextStyle(
                                        fontSize: style.h4FontSize(context),
                                        color: style.mainColor,
                                        fontWeight: style.boldText,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

// Contents-4
class FourthContents extends StatelessWidget {
  const FourthContents({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: style.widgetSize(context),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(style.paddingSize(context))),
            Container(
              padding: EdgeInsets.all(style.paddingSize(context)),
              child: Text('서비스 이용안내',
                  style: TextStyle(
                      color: style.blackColor,
                      fontSize: style.h2FontSize(context),
                      fontWeight: style.boldText)),
            ),
            Padding(padding: EdgeInsets.all(style.paddingSize(context))),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Column(
                      children: [
                        Container(
                          width: style.c4BoxSize(context),
                          height: style.c4BoxSize(context),
                          decoration: BoxDecoration(
                            color: Color(0xFF1E1E1E),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: style.paddingSize(context))),
                        Text(
                          '예약안내',
                          style: TextStyle(fontSize: style.h4FontSize(context)),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Container(
                          width: style.c4BoxSize(context),
                          height: style.c4BoxSize(context),
                          decoration: BoxDecoration(
                            color: Color(0xFF1E1E1E),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: style.paddingSize(context))),
                        Text(
                          '대여/반납',
                          style: TextStyle(fontSize: style.h4FontSize(context)),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Container(
                          width: style.c4BoxSize(context),
                          height: style.c4BoxSize(context),
                          decoration: BoxDecoration(
                            color: Color(0xFF1E1E1E),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: style.paddingSize(context))),
                        Text(
                          '취소/환불',
                          style: TextStyle(fontSize: style.h4FontSize(context)),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Container(
                          width: style.c4BoxSize(context),
                          height: style.c4BoxSize(context),
                          decoration: BoxDecoration(
                            color: Color(0xFF1E1E1E),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: style.paddingSize(context))),
                        Text(
                          '위약금',
                          style: TextStyle(fontSize: style.h4FontSize(context)),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(style.paddingSize(context)))
          ],
        ),
      );
    });
  }
}

// -------------------------------------------------- Main-Fotter ---------------------------------------------------
class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  footerSize(c) {
    if (MediaQuery.of(c).size.width < 640) {
      return 200;
    } else {
      return 300;
    }
  }

  footerLogoSize(c) {
    if (MediaQuery.of(c).size.width < 640) {
      return 30;
    } else if (MediaQuery.of(c).size.width < 1080) {
      return 40;
    } else {
      return 50;
    }
  }

  footerBoxSize(c) {
    if (MediaQuery.of(c).size.width < 640) {
      return 40;
    } else if (MediaQuery.of(c).size.width < 1080) {
      return 50;
    } else {
      return 60;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: 100.w,
        height: footerSize(context),
        padding: EdgeInsets.all(20),
        color: style.mainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text('순양 렌탈센터',
                      style: TextStyle(
                          color: style.whiteColor,
                          fontSize: footerLogoSize(context),
                          fontWeight: style.boldText)),
                ),
                Container(
                  child: Row(
                    children: [
                      InkWell(
                        child: Container(
                          width: footerBoxSize(context),
                          height: footerBoxSize(context),
                          color: style.whiteColor,
                        ),
                        onTap: () {},
                      ),
                      Padding(
                          padding: EdgeInsets.all(style.paddingSize(context))),
                      InkWell(
                        child: Container(
                          width: footerBoxSize(context),
                          height: footerBoxSize(context),
                          color: style.whiteColor,
                        ),
                        onTap: () {},
                      ),
                      Padding(
                          padding: EdgeInsets.all(style.paddingSize(context))),
                      InkWell(
                        child: Container(
                          width: footerBoxSize(context),
                          height: footerBoxSize(context),
                          color: style.whiteColor,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '(주)데시그너 대표이사 : 김주현' + ' | ' + '사업자등록번호 : 000-00-00000',
                    style: TextStyle(
                        color: style.whiteColor,
                        fontSize: style.h5FontSize(context)),
                  ),
                  Text(
                    '인천광역시 미추홀구 석정로 200' + ' | ' + '우편번호 : 000000',
                    style: TextStyle(
                        color: style.whiteColor,
                        fontSize: style.h5FontSize(context)),
                  ),
                  Text(
                    'Copyright ⓒ 2023 by Designer',
                    style: TextStyle(
                        color: style.whiteColor,
                        fontSize: style.h5FontSize(context)),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
