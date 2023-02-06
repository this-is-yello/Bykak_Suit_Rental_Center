import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

class MyPointScreen extends StatefulWidget {
  const MyPointScreen({super.key});

  @override
  State<MyPointScreen> createState() => _MyPointScreenState();
}

class _MyPointScreenState extends State<MyPointScreen> {
  bool _isLoading = true;

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
        title: Center(child: MyPointAppBar(),),
      ),
      body: ResponsiveSizer(builder: (context, orientation, screenType) {
        return DefaultTabController(
          length: 2,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: CustomScrollView(      
                    slivers: [
                      SliverAppBar(
                        elevation: 0,
                        pinned: true,
                        floating: true,
                        centerTitle: true,
                        automaticallyImplyLeading: false,
                        expandedHeight: 80,
                        toolbarHeight: 80,
                        backgroundColor: style.mainColor,
                        title: Container(
                          width: style.widgetSize(context),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text('마이포인트', style: TextStyle(fontSize: style.h1FontSize(context), fontWeight: style.boldText, color: style.whiteColor)),  
                              ),
                              Container(
                                child: Text('1000' + 'P', style: TextStyle(fontSize: style.h1FontSize(context), fontWeight: style.boldText, color: style.whiteColor)),  
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                  )
                ),
                Container(
                  color: style.mainColor,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: style.whiteColor,
                    labelColor: style.whiteColor,
                    unselectedLabelColor: style.greyColor,
                    tabs: [
                      Tab(
                        text: '적립내역',
                      ),
                      Tab(
                        text: '사용내역',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: style.widgetSize(context),
                    height: double.infinity,
                    child: TabBarView(
                      children: [
                        Center(
                          child: GivePointHistory(),
                        ),
                        Center(
                          child: UsePointHistory(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}


// -------------------------------------------------- AppBar ---------------------------------------------------
class MyPointAppBar extends StatelessWidget {
  const MyPointAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '포인트 조회',
            style:
                TextStyle(color: style.whiteColor, fontWeight: style.boldText),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------- Contents ---------------------------------------------------
class GivePointHistory extends StatelessWidget {
  const GivePointHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 20,
            (context, index) => Container(
              width: style.widgetSize(context),
              padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('[적립]' + ' ' + '대여감사 포인트', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText)),
                    Padding(padding: EdgeInsets.all(2)),
                    Text('+' + '500' + 'P', style: TextStyle(fontSize: style.h3FontSize(context), color: style.greyColor))
                  ],
                ),
            )
          )
        )
      ]  
    );
  }
}

class UsePointHistory extends StatelessWidget {
  const UsePointHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 20,
            (context, index) => Container(
              width: style.widgetSize(context),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('[사용]' + ' ' + '23.01.28', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText)),
                  Padding(padding: EdgeInsets.all(2)),
                  Text('-' + '500' + 'P', style: TextStyle(fontSize: style.h3FontSize(context), color: style.greyColor))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}