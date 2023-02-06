import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

class InquiryManegementScreen extends StatefulWidget {
  const InquiryManegementScreen({super.key});

  @override
  State<InquiryManegementScreen> createState() => _InquiryManegementScreenState();
}

class _InquiryManegementScreenState extends State<InquiryManegementScreen> {
  bool _isLoading= true;

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
        shadowColor: Color.fromARGB(0, 0, 0, 0),
        title: Center(child: InquiryManegementAppBar()),
      ),
      body: ResponsiveSizer(builder: (context, orientation, screenType) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: true,
              centerTitle: true,
              automaticallyImplyLeading: false,
              expandedHeight: 50,
              toolbarHeight: 50,
              backgroundColor: style.mainColor,
              title: Column(
                children: [
                  Container(
                    width: style.widgetSize(context),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.grey,
                                  width: 1
                                )
                              )
                            ),
                            height: 48,
                            child: Center(child: Text('이름', style: TextStyle(color: style.whiteColor, fontSize: 18, fontWeight: style.boldText)))
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: style.lightGreyColor,
                                  width: 1
                                )
                              )
                            ),
                            height: 48,
                            child: Center(child: Text('제목', style: TextStyle(color: style.whiteColor, fontSize: 18, fontWeight: style.boldText)))
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: InkWell(
                            child: Container(
                              height: 48,
                              child: Center(child: Text('문의일자', style: TextStyle(color: style.whiteColor, fontSize: 18, fontWeight: style.boldText)))
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 12,
                (context, index) => Center(
                  child: Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(8),
                    child: InkWell(
                      child: Container(
                        height: 50,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 3,
                              child: Container(
                                // height: 40,
                                child: Center(child: Text('이름', style: TextStyle(fontSize: style.h5FontSize(context)),))
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              child: Container(
                                // height: 40,
                                child: Center(child: Text('사이즈 문의', style: TextStyle(fontSize: style.h5FontSize(context)),))
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              child: Container(
                                // height: 40,
                                child: Center(child: Text('23.02.02(목)', style: TextStyle(fontSize: style.h5FontSize(context)),))
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Color.fromARGB(0, 0, 0, 0),
                          context: context,
                          builder: (BuildContext context) {
                            return InquiryInformation();
                          }
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}


// -------------------------------------------------- AppBar ---------------------------------------------------
class InquiryManegementAppBar extends StatelessWidget {
  const InquiryManegementAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '문의관리',
            style:
                TextStyle(color: style.whiteColor, fontWeight: style.boldText),
          ),
        ],
      ),
    );
  }
}


class InquiryInformation extends StatefulWidget {
  const InquiryInformation({super.key});

  @override
  State<InquiryInformation> createState() => _InquiryInformationState();
}

class _InquiryInformationState extends State<InquiryInformation> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          width: style.widgetSize(context),
          height: 96.h,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: style.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: ListView(
            children: [
              IconButton(
                icon: Icon(Icons.keyboard_double_arrow_down_rounded,
                size: 30, color: style.blackColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8)),
              Column(
                children: [
                  Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: style.c5BoxSize(context),
                          height: style.c5BoxSize(context),
                          decoration: BoxDecoration(
                            color: style.blackColor,
                            borderRadius: BorderRadius.circular(1000)
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('이름', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText)),
                            Padding(padding: EdgeInsets.only(top: 4)),
                            Text('01012345678', style: TextStyle(fontSize: style.h4FontSize(context), color: style.greyColor)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: style.widgetSize(context),
                    height: 2,
                    color: style.lightGreyColor,
                  ),
                  Container(
                    width: style.widgetSize(context),
                    height: 240,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('제목', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText)),
                        Padding(padding: EdgeInsets.all(4)),
                        Text('대여상품 기본구성이 궁금합니다.', style: TextStyle(fontSize: style.h3FontSize(context))),
                      ],
                    ),
                  ),
                  Container(
                    width: style.widgetSize(context),
                    height: 2,
                    color: style.lightGreyColor,
                  ),
                  Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('대기중', // 연락완료
                            style: TextStyle(
                              fontSize: style.h3FontSize(context),
                              fontWeight: style.boldText,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: style.mainColor,
                            minimumSize: Size(96, 48)
                          ),
                          child: Text('상태변경', style: TextStyle(fontSize: style.h5FontSize(context)),),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: style.widgetSize(context),
                    height: 2,
                    color: style.lightGreyColor,
                  ),
                ],
              ),
            ]
          ),
        );
      }
    );
  }
}