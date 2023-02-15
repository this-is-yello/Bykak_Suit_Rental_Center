import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bykaksuitrentalcenter/screens/rent/booked_detail_page.dart';

class MakeBookScreen extends StatefulWidget {
  const MakeBookScreen({super.key});

  @override
  State<MakeBookScreen> createState() => _MakeBookScreenState();
}

class _MakeBookScreenState extends State<MakeBookScreen> {
  bool _columnState = false;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 1080) {
      setState(() {
        _columnState = false;
      });
    } else {
      setState(() {
        _columnState = true;
      });
    }

    var rentRange = Row(
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
    );
    var counselTime = Row(
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
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: style.mainColor,
        title: Center(child: MakeABookAppBar(),),
      ),
      body: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return ListView(
            children: [
              Center(
                child: Container(
                  width: style.widgetSize(context),
                  padding: EdgeInsets.all(16),
                  child: Container(
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
                              Padding(padding: EdgeInsets.all(4)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: style.widgetSize(context),
                  padding: EdgeInsets.all(16),
                  child: Container(
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
                          child: _columnState ? Row(
                            children: [
                              rentRange,
                              Padding(padding: EdgeInsets.all(4)),
                              Container(
                                width: 2,
                                height:24,
                                color: style.greyColor,
                              ),
                              Padding(padding: EdgeInsets.all(4)),
                              counselTime,
                            ],
                          ) : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              rentRange,
                              Padding(padding: EdgeInsets.all(4)),
                              counselTime,
                            ],
                          )
                        ),
                        Padding(padding: EdgeInsets.all(4)),
                        Text(
                          '대여샵',
                          style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: style.widgetSize(context),
                  padding: EdgeInsets.all(16),
                  child: Container(
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
                          '렌탈샵 위치',
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
                          width: double.infinity,
                          height: 400,
                          color: style.lightGreyColor,
                          child: Center(child: Text('지도'),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: style.widgetSize(context),
                  padding: EdgeInsets.all(16),
                  child: Container(
                    // padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: style.whiteColor,
                                border: Border.all(color: style.mainColor, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '취소',
                                  style: TextStyle(
                                    fontSize: style.h3FontSize(context),
                                    color: style.mainColor
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.back();
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: style.mainColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text('예약하기',
                                  style: TextStyle(
                                    fontSize: style.h3FontSize(context),
                                    color: style.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ClickBookBtnDialog();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}


// -------------------------------------------------- AppBar ---------------------------------------------------
class MakeABookAppBar extends StatelessWidget {
  const MakeABookAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '상품예약',
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


class ClickBookBtnDialog extends StatelessWidget {
  const ClickBookBtnDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        '예약을 하시겠습니까?',
        style: TextStyle(
          fontSize: style.h3FontSize(context),
          color: style.blackColor,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text(
                '아니오',
                style: TextStyle(
                  fontSize: style.h4FontSize(context),
                  color: style.mainColor,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(padding: EdgeInsets.all(4)),
            TextButton(
              child: Text(
                '예',
                style: TextStyle(
                  fontSize: style.h4FontSize(context),
                  color: style.mainColor,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookedDetailScreen(),
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}