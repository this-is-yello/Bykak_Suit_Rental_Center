import 'dart:html';

import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:flutter/scheduler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bykaksuitrentalcenter/firebase_options.dart';

import 'package:bykaksuitrentalcenter/screens/account/shopping_bag_page.dart';
import 'package:bykaksuitrentalcenter/screens/admin/user_manegement_page.dart';
import 'package:bykaksuitrentalcenter/screens/admin/product_manegement_page.dart';
import 'package:bykaksuitrentalcenter/screens/admin/book_manegement_page.dart';
import 'package:bykaksuitrentalcenter/screens/admin/Inquiry_manegement_page.dart';
import 'package:bykaksuitrentalcenter/screens/admin/search_barcode_page.dart';
import 'package:bykaksuitrentalcenter/screens/user/my_point_page.dart';
import 'package:bykaksuitrentalcenter/screens/user/my_size_page.dart';
import 'package:bykaksuitrentalcenter/screens/user/book_history_page.dart';
import 'package:bykaksuitrentalcenter/screens/user/like_product_page.dart';


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
        shadowColor: Color.fromARGB(0, 0, 0, 0),
        title: Center(child: MyPageAppBar()),
      ),
      body: ResponsiveSizer(builder: (context, orientation, screenType) {
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
                            // AdminMenu(),
                            UserMenu(),
                          ],
                        )
                      : Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileNameNumber(),
                            // AdminMenu(),
                            UserMenu(),
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
                    padding: EdgeInsets.all(style.paddingSize(context)),
                  ),
                  Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(16),
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
                    padding: EdgeInsets.all(16),
                    child: MediaQuery.of(context).size.width < 1080
                        ? Column(
                            children: [
                              CalenderWidget(),
                              Padding(padding: EdgeInsets.all(20)),
                              ScheduleWidget(),
                            ],
                          )
                        : Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              CalenderWidget(),
                              ScheduleWidget(),
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingBagScreen(),),);
                },
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
                  Padding(padding: EdgeInsets.only(top: 8)),
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
class UserMenu extends StatelessWidget {
  const UserMenu({super.key});

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
                    height: 56,
                    child: Center(
                      child: Text(
                        '마이사이즈',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MySizeScreen(),),);
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  child: Container(
                    height: 56,
                    child: Center(
                      child: Text(
                        '좋아요',
                        style: TextStyle(
                          fontSize: style.h3FontSize(context),
                          color: style.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LikeProductScreen(),),);
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  child: Container(
                    height: 56,
                    child: Center(
                      child: Text(
                        '문의내역',
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
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            '포인트',
                            style: TextStyle(
                                fontSize: style.h3FontSize(context),
                                color: style.whiteColor),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            '1000' + 'P',
                            style: TextStyle(
                                fontSize: style.h3FontSize(context),
                                color: style.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPointScreen(),
                      ),
                    );
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            '예약내역',
                            style: TextStyle(
                                fontSize: style.h3FontSize(context),
                                color: style.whiteColor),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            '2' + '건',
                            style: TextStyle(
                                fontSize: style.h3FontSize(context),
                                color: style.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookHistoryScreen(),
                        ),
                      );
                    },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//AdminMenu
class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

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
                    height: 56,
                    child: Center(
                      child: Text(
                        '회원관리',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserManegementScreen(),),);
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  child: Container(
                    height: 56,
                    child: Center(
                      child: Text(
                        '예약관리',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookManegementScreen(),),);
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  child: Container(
                    height: 56,
                    child: Center(
                      child: Text(
                        '문의관리',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InquiryManegementScreen(),),);
                  },
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
                    height: 56,
                    child: Center(
                      child: Text(
                        '제품관리',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductManegementScreen(),),);
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: InkWell(
                  child: Container(
                    height: 56,
                    child: Center(
                      child: Text(
                        '바코드로 제품검색',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchBarcodeScreen(),),);
                  },
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
class CalenderWidget extends StatelessWidget {
  const CalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width < 1080 ? 560 : 500,
      ),
      child: Container(
        // width: style.widgetSize(context),
        height: 400,
        // padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: style.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [style.boxShadows],
        ),
        child: Center(
          child: CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2099),
            onDateChanged: (value) => value!,
          ),
        ),
      ),
    );
  }
}

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width < 1080 ? 560 : 400,
      ),
      child: Container(
        height: 400,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: style.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [style.boxShadows],
        ),
      ),
    );
  }
}
