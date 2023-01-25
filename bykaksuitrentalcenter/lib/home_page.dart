import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;

import 'package:responsive_sizer/responsive_sizer.dart';

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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: style.whiteColor,
        iconTheme: IconThemeData(color: style.blackColor),
        title: Center(
          child: MediaQuery.of(context).size.width < 640
              ? PhoneAppBar()
              : WideAppBar(),
        ),
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
          : ListView(
              children: [
                Container(
                  child: Center(child: MainBanner()),
                ),
                Container(
                  child: Center(child: FirstContents()),
                ),
              ],
            ),
    );
  }
}

// -------------------------------------------------- AppBar ---------------------------------------------------
class PhoneAppBar extends StatelessWidget {
  const PhoneAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          Text('순양 렌탈센터',
              style: TextStyle(
                  color: style.blackColor, fontWeight: FontWeight.w700)),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

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
                  color: style.blackColor, fontWeight: style.boldText)),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text(
                    '예약내역',
                    style: TextStyle(
                        fontSize: 16,
                        color: style.blackColor,
                        fontWeight: style.boldText),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text(
                    '마이페이지',
                    style: TextStyle(
                        fontSize: 16,
                        color: style.blackColor,
                        fontWeight: style.boldText),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text(
                    '로그인',
                    style: TextStyle(
                        fontSize: 16,
                        color: style.blackColor,
                        fontWeight: style.boldText),
                  ),
                  onPressed: () {},
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
      return Container(
        width: 100.w,
        height: 40.w,
        color: style.mainColor,
        child: Center(
          child: Text(
            'K!mjuhyeon by 覺 BANNER',
            style: TextStyle(fontWeight: style.boldText),
          ),
        ),
      );
    });
  }
}

// -------------------------------------------------- Contents-1 ---------------------------------------------------
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
                    color: Colors.white,
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
                          color: Colors.white,
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
                          color: Colors.white,
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
