import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bykaksuitrentalcenter/home_page.dart';

class BookHistoryScreen extends StatelessWidget {
  const BookHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: style.mainColor,
        title: Center(child: BookHistoryAppBar()),
      ),
      body: ResponsiveSizer(builder: (context, orientation, screenType) {
        return ListView(
          children: [],
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
