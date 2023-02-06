import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

class BookHistoryScreen extends StatefulWidget {
  const BookHistoryScreen({super.key});

  @override
  State<BookHistoryScreen> createState() => _BookHistoryScreenState();
}

class _BookHistoryScreenState extends State<BookHistoryScreen> {
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
        title: Center(child: BookHistoryAppBar()),
      ),
      body: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 20,
                  (context, index) => Center(
                    child: Container(
                      width: style.widgetSize(context),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('[면접대여] 블랙 솔리드 슈트', style: TextStyle(color: style.blackColor, fontSize: style.h4FontSize(context), fontWeight: style.boldText)),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Text('YY.MM.DD' + ' - ' + 'YY.MM.DD', style: TextStyle(fontSize: style.h4FontSize(context), color: style.greyColor)),
                                      Padding(padding: EdgeInsets.all(4)),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: style.mainColor,
                                        ),
                                        child: Text('상세보기'),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // margin: EdgeInsets.all(8),
                                  width: MediaQuery.of(context).size.width < 1080 ? 96 : 160,
                                  height: MediaQuery.of(context).size.width < 1080 ? 96 : 160,
                                  color: style.mainColor,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: style.lightGreyColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


// -------------------------------------------------- AppBar ---------------------------------------------------
class BookHistoryAppBar extends StatelessWidget {
  const BookHistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '예약내역',
            style:
              TextStyle(
                color: style.whiteColor,
                fontWeight: style.boldText,
            ),
          ),
        ],
      ),
    );
  }
}