import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductManegementScreen extends StatefulWidget {
  const ProductManegementScreen({super.key});

  @override
  State<ProductManegementScreen> createState() => _ProductManegementScreenState();
}

class _ProductManegementScreenState extends State<ProductManegementScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    return Scaffold(
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
            return DefaultTabController(
              length: 6,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 160,
                      child: CustomScrollView(      
                        slivers: [
                          SliverAppBar(
                            elevation: 0,
                            pinned: true,
                            floating: true,
                            centerTitle: true,
                            automaticallyImplyLeading: false,
                            expandedHeight: 160,
                            toolbarHeight: 160,
                            backgroundColor: style.mainColor,
                            title: Column(
                              children: [
                                Container(
                                  width: style.widgetSize(context),
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('제품관리', style: TextStyle(fontSize: 24, fontWeight: style.boldText)),
                                      IconButton(
                                        icon: Icon(Icons.add, size: 30,),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: style.widgetSize(context),
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: TextField(
                                    // controller: inputSearch,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: style.whiteColor,
                                      prefixIcon: Icon(Icons.search, color: style.mainColor),
                                      hintText: '제품의 이름이나 번호를 입력하세요.',
                                      border: OutlineInputBorder(borderSide: BorderSide(width: 2), borderRadius: BorderRadius.circular(8)),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: style.whiteColor), borderRadius: BorderRadius.circular(8)),
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.qr_code_scanner_rounded, color: style.mainColor),
                                        onPressed: () {},
                                      )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                      )
                    ),
                    Container(
                      color: style.mainColor,
                      child: Container(
                        color: style.mainColor,
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: style.whiteColor,
                          labelColor: style.whiteColor,
                          unselectedLabelColor: style.greyColor,
                          tabs: [
                            Tab(
                              text: '자켓',
                            ),
                            Tab(
                              text: '팬츠',
                            ),
                            Tab(
                              text: '셔츠',
                            ),
                            Tab(
                              text: '조끼',
                            ),
                            Tab(
                              text: '구두',
                            ),
                            Tab(
                              text: '잡화',
                            )
                          ],
                        ),
                      )
                    ),
                    Expanded(
                      child: Container(
                        width: style.widgetSize(context),
                        height: double.infinity,
                        child: TabBarView(
                          children: [
                            Center(
                              child: ProductTabBarScreen(),
                            ),
                            Center(
                              child: ProductTabBarScreen(),
                            ),
                            Center(
                              child: ProductTabBarScreen(),
                            ),
                            Center(
                              child: ProductTabBarScreen(),
                            ),
                            Center(
                              child: ProductTabBarScreen(),
                            ),
                            Center(
                              child: ProductTabBarScreen(),
                            ),
                            
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        );
  }
}


class ProductTabBarScreen extends StatelessWidget {
  const ProductTabBarScreen({super.key});

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
              child: InkWell(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: style.c5BoxSize(context),
                      height: style.c5BoxSize(context),
                      decoration: BoxDecoration(
                        color: style.blackColor,
                        borderRadius: BorderRadius.circular(1000)
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: style.paddingSize(context))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('제품명' + ' ' + '사이즈', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText)),
                        Padding(padding: EdgeInsets.all(2)),
                        Text('0101110101010110', style: TextStyle(fontSize: style.h4FontSize(context), color: style.greyColor))
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    
                    context: context,
                    builder: (BuildContext context) {
                      return ResponsiveSizer(builder: (context, orientation, screenType) {
                        return Container(
                          height: 100.h,
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 500,
                                color: Colors.red,
                              ),
                              Container(
                                width: 100,
                                height: 500,
                                color: Colors.green,
                              ),
                              Container(
                                width: 100,
                                height: 500,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        );
                      });
                    }
                  );
                },
              ),
            )
          )
        )
      ]  
      );
  }
}


class ProductInformation extends StatefulWidget {
  const ProductInformation({super.key});

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    return Scaffold(
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
          return CustomScrollView(
            slivers: [

            ],
          );
        }),
    );
  }
}