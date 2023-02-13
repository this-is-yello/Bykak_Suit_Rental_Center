import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bykaksuitrentalcenter/home_page.dart';


class BookedDetailScreen extends StatefulWidget {
  const BookedDetailScreen({super.key});

  @override
  State<BookedDetailScreen> createState() => _BookedDetailScreenState();
}

class _BookedDetailScreenState extends State<BookedDetailScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
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
            title: Center(child: BookedDetailAppBar(),),
          ),
          body: ListView(
            children: [
              Center(
                child: Container(
                  width: style.widgetSize(context),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: style.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [style.boxShadows]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '예약정보',
                              style: TextStyle(
                                fontSize: style.h2FontSize(context),
                                fontWeight: style.boldText,
                                color: style.blackColor,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 2,
                              color: style.lightGreyColor,
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Row(
                              children: [
                                Text(
                                  '예약번호',
                                  style: TextStyle(
                                    fontSize: style.h3FontSize(context),
                                    fontWeight: style.boldText,
                                    color: style.blackColor,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(4)),
                                Text(
                                  '2024020901020300',
                                  style: TextStyle(
                                    fontSize: style.h3FontSize(context),
                                    color: style.blackColor,
                                  ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(4),),
                            Row(
                              children: [
                                Text(
                                  '렌탈샵',
                                  style: TextStyle(
                                    fontSize: style.h3FontSize(context),
                                    fontWeight: style.boldText,
                                    color: style.blackColor,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(4)),
                                Text(
                                  '김주현바이각',
                                  style: TextStyle(
                                    fontSize: style.h3FontSize(context),
                                    color: style.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(4),),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text('예약변경', style: TextStyle(color: style.mainColor, fontSize: style.h4FontSize(context), fontWeight: style.boldText,),),
                              onPressed: () {},
                            ),
                            Padding(padding: EdgeInsets.all(4)),
                            TextButton(
                              child: Text('예약취소', style: TextStyle(color: style.mainColor, fontSize: style.h4FontSize(context), fontWeight: style.boldText,),),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(4),),
                      Container(
                        width: style.widgetSize(context),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: style.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [style.boxShadows]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '예약자 정보',
                              style: TextStyle(
                                fontSize: style.h2FontSize(context),
                                fontWeight: style.boldText,
                                color: style.blackColor,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 2,
                              color: style.lightGreyColor,
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    '이름',
                                    style: TextStyle(
                                      fontSize: style.h3FontSize(context),
                                      fontWeight: style.boldText,
                                      color: style.blackColor,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Text(
                                    '유저네임',
                                    style: TextStyle(
                                      fontSize: style.h3FontSize(context),
                                      color: style.blackColor,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(4)),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(4)),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    '핸드폰번호',
                                    style: TextStyle(
                                      fontSize: style.h3FontSize(context),
                                      fontWeight: style.boldText,
                                      color: style.blackColor,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Text(
                                    '01012123434',
                                    style: TextStyle(
                                      fontSize: style.h3FontSize(context),
                                      color: style.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8),),
                      Container(
                        width: style.widgetSize(context),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: style.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [style.boxShadows]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '대여 및 상담정보',
                              style: TextStyle(
                                fontSize: style.h2FontSize(context),
                                fontWeight: style.boldText,
                                color: style.blackColor,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 2,
                              color: style.lightGreyColor,
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    '대여일정',
                                    style: TextStyle(
                                      fontSize: style.h3FontSize(context),
                                      fontWeight: style.boldText,
                                      color: style.blackColor,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Text(
                                    'YY.MM.DD' + ' - ' + 'YY.MM.DD',
                                    style: TextStyle(
                                      fontSize: style.h3FontSize(context),
                                      color: style.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(4)),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    '상담시간',
                                    style: TextStyle(
                                      fontSize: style.h3FontSize(context),
                                      fontWeight: style.boldText,
                                      color: style.blackColor,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Text(
                                    'YY.MM.DD' + ' / ' + 'HH.MM 오후',
                                    style: TextStyle(
                                      fontSize: style.h3FontSize(context),
                                      color: style.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(4)),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    '예상금액',
                                    style: TextStyle(
                                      fontSize: style.h3FontSize(context),
                                      fontWeight: style.boldText,
                                      color: style.blackColor,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Text(
                                    '50000원',
                                    style: TextStyle(
                                      fontSize: style.h3FontSize(context),
                                      color: style.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(4)),
                            Text(
                              '※결제는 매장에서 진행하며, 상담 후 가격은 변동될 수 있습니다.',
                              style: TextStyle(
                                fontSize: style.h5FontSize(context),
                                color: style.blackColor
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8),),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: style.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [style.boxShadows]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '예약상품 정보',
                              style: TextStyle(
                                fontSize: style.h2FontSize(context),
                                fontWeight: style.boldText,
                                color: style.blackColor,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 2,
                              color: style.lightGreyColor,
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Container(
                              height: 300,
                              child: ListView.builder(
                                itemCount: 8,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsetsDirectional.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '[대여종류] 상품명',
                                          style: TextStyle(
                                            fontSize: style.h3FontSize(context),
                                            fontWeight: style.boldText,
                                            color: style.blackColor,
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(4)),
                                        Text(
                                          '상의 ' + 'L' + ' / ' + '하의 ' + 'L',
                                          style: TextStyle(
                                            fontSize: style.h3FontSize(context),
                                            color: style.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: style.widgetSize(context),
                  padding: EdgeInsets.all(16),
                  child: InkWell(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: style.mainColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text('홈으로',
                          style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


// -------------------------------------------------- AppBar ---------------------------------------------------
class BookedDetailAppBar extends StatelessWidget {
  const BookedDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '예약상세',
            style: TextStyle(
              color: style.whiteColor,
              fontWeight: style.boldText
            ),
          ),
        ],
      ),
    );
  }
}