import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bykaksuitrentalcenter/home_page.dart';
import 'package:bykaksuitrentalcenter/screens/account/shopping_bag_page.dart';

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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: style.mainColor,
        title: Center(child: BookHistoryAppBar()),
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
              return Center(
                child: Container(
                  width: style.widgetSize(context),
                  padding: EdgeInsets.all(16),
                  child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1,
                      crossAxisCount:
                          MediaQuery.of(context).size.width < 1080 ? 1 : 2,
                      mainAxisSpacing: style.paddingSize(context),
                      crossAxisSpacing: style.paddingSize(context),
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width >= 640 ? 300 : 200,
                              height: MediaQuery.of(context).size.width >= 640 ? 300 : 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: style.mainColor,
                              )
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('[대여종류]' + '상품이름', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText),),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Text('yy.mm.dd' + ' - ' + 'yy.mm.dd', style: TextStyle(color: style.greyColor, fontSize: style.h4FontSize(context))),
                                  Padding(padding: EdgeInsets.all(4)),
                                  InkWell(
                                    child: Text('상세보기>', style: TextStyle(color: Colors.indigo, fontSize: style.h4FontSize(context), fontWeight: style.boldText),),
                                    onTap: () {},
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
      }),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '예약내역',
            style:
                TextStyle(color: style.whiteColor, fontWeight: style.boldText),
          ),
          IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingBagScreen()));
            },
          ),
        ],
      ),
    );
  }
}