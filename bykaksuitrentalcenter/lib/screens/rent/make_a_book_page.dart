import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

class MakeABookScreen extends StatefulWidget {
  const MakeABookScreen({super.key});

  @override
  State<MakeABookScreen> createState() => _MakeABookScreenState();
}

class _MakeABookScreenState extends State<MakeABookScreen> {
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
                          '[대여형태] 상품명',
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
                              '사이즈',
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
                        Padding(padding: EdgeInsets.all(4)),
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
                                '유제네임',
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
                            onTap: () {},
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
                            onTap: () {},
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