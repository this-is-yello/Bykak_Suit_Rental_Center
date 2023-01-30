import 'dart:html';

import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bykaksuitrentalcenter/firebase_options.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  bool _isLoading = true;
  bool _columnState = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    if (MediaQuery.of(context).size.width < 1080) {
      setState(() {
        _columnState = true;
      });
    } else {
      setState(() {
        _columnState = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: style.mainColor,
        shadowColor: Color.fromARGB(0, 0, 0, 0),
        title: Center(child: MyPageAppBar()),
      ),
      body: _isLoading
          ? Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  color: style.mainColor,
                ),
              ),
            )
          : ResponsiveSizer(builder: (context, orientation, screenType) {
              return ListView(
                children: [
                  Container(
                    width: 100.w,
                    height: style.userInfoBoxHeight(context),
                    color: style.mainColor,
                    child: Center(
                      child: Container(
                        width: style.widgetSize(context),
                        child: _columnState
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ProfileNameNumber(),
                                  Manegement(),
                                  // PointBookSizeInfo(),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ProfileNameNumber(),
                                  Manegement(),
                                  // PointBookSizeInfo(),
                                ],
                              ),
                      ),
                    ),
                  ),
                  Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.all(style.paddingSize(context))),
                        Container(
                          child: Text(
                            '대여일정',
                            style: TextStyle(
                                fontSize: style.h2FontSize(context),
                                color: style.blackColor,
                                fontWeight: style.boldText),
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.all(style.paddingSize(context))),
                        Container(
                          width: style.widgetSize(context),
                          child: MediaQuery.of(context).size.width < 1080
                              ? Column(
                                  children: [
                                    Calender(),
                                    Padding(padding: EdgeInsets.all(20)),
                                    Schedule(),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Calender(),
                                    // Padding(padding: EdgeInsets.all(20)),
                                    Schedule(),
                                  ],
                                ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
    );
  }
}

// -------------------------------------------------- AppBar ---------------------------------------------------
class MyPageAppBar extends StatelessWidget {
  const MyPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '마이페이지',
            style:
                TextStyle(color: style.whiteColor, fontWeight: style.boldText),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_bag),
                onPressed: () {},
              ),
              TextButton(
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                      fontSize: 16,
                      color: style.whiteColor,
                      fontWeight: style.boldText),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------- Proflie ---------------------------------------------------
// NameNumber
class ProfileNameNumber extends StatelessWidget {
  const ProfileNameNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: style.widgetSize(context),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: style.c4BoxSize(context),
                height: style.c4BoxSize(context),
                decoration: BoxDecoration(
                    color: style.blackColor,
                    borderRadius: BorderRadius.circular(200)),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '유저네임',
                      style: TextStyle(
                          fontSize: style.h3FontSize(context),
                          color: style.whiteColor,
                          fontWeight: style.boldText),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(2)),
                  Container(
                    child: Text(
                      '010-0000-0000',
                      style: TextStyle(
                          fontSize: style.h3FontSize(context),
                          color: style.whiteColor,
                          fontWeight: style.boldText),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// UserMenu
class PointBookSizeInfo extends StatelessWidget {
  const PointBookSizeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 1080
          ? 560
          : style.widgetSize(context),
      padding: EdgeInsets.all(16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '포인트',
                style: TextStyle(
                    fontSize: style.h3FontSize(context),
                    color: style.whiteColor),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Text(
                '1000' + 'P',
                style: TextStyle(
                    fontSize: style.h3FontSize(context),
                    color: style.whiteColor),
              ),
            ],
          ),
          onTap: () {},
        ),
        InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '예약내역',
                style: TextStyle(
                    fontSize: style.h3FontSize(context),
                    color: style.whiteColor),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Text(
                '2' + '건',
                style: TextStyle(
                    fontSize: style.h3FontSize(context),
                    color: style.whiteColor),
              ),
            ],
          ),
          onTap: () {},
        ),
        InkWell(
          child: Text(
            '마이 사이즈',
            style: TextStyle(
                fontSize: style.h3FontSize(context), color: style.whiteColor),
          ),
          onTap: () {},
        ),
      ]),
    );
  }
}

//AdminMenu
class Manegement extends StatelessWidget {
  const Manegement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 1080
          ? 560
          : style.widgetSize(context),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  child: Container(
                    child: Center(
                      child: Text(
                        '회원관리',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                width: 2,
                height: 24,
                color: style.lightGreyColor,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  child: Container(
                    child: Center(
                      child: Text(
                        '예약관리',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                width: 2,
                height: 24,
                color: style.lightGreyColor,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  child: Container(
                    child: Center(
                      child: Text(
                        '문의관리',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(4)),
          Container(
            width: double.infinity,
            height: 2,
            color: style.lightGreyColor,
          ),
          Padding(padding: EdgeInsets.all(6)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  child: Container(
                    child: Center(
                      child: Text(
                        '제품관리',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                width: 2,
                height: 24,
                color: style.lightGreyColor,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  child: Container(
                    child: Center(
                      child: Text(
                        '바코드로 제품검색',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------- RentSchedule ---------------------------------------------------
class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 560,
      ),
      child: Container(
        // width: style.widgetSize(context),
        height: 400,
        padding: EdgeInsets.all(16),
        color: style.greyColor,
        child: Center(child: Text('달력')),
      ),
    );
  }
}

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width < 1080 ? 560 : 480,
      ),
      child: Container(
        height: 400,
        padding: EdgeInsets.all(16),
        child: Center(child: Text('스케줄 목록')),
        color: style.greyColor,
      ),
    );
  }
}
