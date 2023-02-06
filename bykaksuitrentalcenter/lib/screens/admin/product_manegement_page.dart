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
        title: Center(child: ProductManegementAppBar(),),
      ),
      body: ResponsiveSizer(builder: (context, orientation, screenType) {
        return DefaultTabController(
          length: 6,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 120,
                  child: CustomScrollView(      
                    slivers: [
                      SliverAppBar(
                        elevation: 0,
                        pinned: true,
                        floating: true,
                        centerTitle: true,
                        automaticallyImplyLeading: false,
                        expandedHeight: 120,
                        toolbarHeight: 120,
                        backgroundColor: style.mainColor,
                        title: Column(
                          children: [
                            Container(
                              width: style.widgetSize(context),
                              padding: EdgeInsets.all(16),
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
                    // width: style.widgetSize(context),
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


// -------------------------------------------------- AppBar ---------------------------------------------------
class ProductManegementAppBar extends StatelessWidget {
  const ProductManegementAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '제품관리',
            style:
                TextStyle(color: style.whiteColor, fontWeight: style.boldText),
          ),
          IconButton(
            icon: Icon(Icons.add,),
            onPressed: () {},
          )
        ],
      ),
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
                        Text('0101110101010110', style: TextStyle(fontSize: style.h3FontSize(context), color: style.greyColor))
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Color.fromARGB(0, 0, 0, 0),
                    context: context,
                    builder: (BuildContext context) {
                      return ProductInformation();
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('제품명' + ' ' + '사이즈', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText)),
                            Padding(padding: EdgeInsets.only(top: 4)),
                            Text('01011011011101', style: TextStyle(fontSize: style.h4FontSize(context), color: style.greyColor))
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: style.mainColor,
                            minimumSize: Size(96, 48)
                          ),
                          child: Text('정보수정', style: TextStyle(fontSize: style.h5FontSize(context)),),
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
                  Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            color: style.mainColor,
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Container(
                            width: 200,
                            height: 200,
                            color: style.mainColor,
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Container(
                            width: 200,
                            height: 200,
                            color: style.mainColor,
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Container(
                            width: 200,
                            height: 200,
                            color: style.mainColor,
                          ),
                        ],
                      ),
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
                          child: Text('대여중', // 대기중, 상담중 , 대여중, 세탁중
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
                  Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          width: style.widgetSize(context),
                          child: Text(
                            '제품이력',
                            style: TextStyle(
                              fontSize: style.h3FontSize(context),
                              fontWeight: style.boldText,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      '대여횟수' + ' ' + ':' + ' ',
                                      style: TextStyle(
                                        fontWeight: style.boldText,
                                        fontSize: style.h4FontSize(context)
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'n' + '회',
                                      style: TextStyle(
                                        fontSize: style.h4FontSize(context)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(4)),
                              Column(
                                children: [
                                  Container(
                                    width: style.widgetSize(context),
                                    child: Text(
                                      '제품이력(특이사항) :',
                                      style: TextStyle(
                                        fontWeight: style.boldText,
                                        fontSize: style.h4FontSize(context)
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.all(2)),
                                  Container(
                                    width: style.widgetSize(context),
                                    height: 240,
                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                                    child: ListView.builder(
                                      itemCount: 14,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: style.widgetSize(context),
                                          child: Text(
                                            '22.11.14' + ' ' + '대여',
                                            style: TextStyle(
                                              fontSize: style.h4FontSize(context)
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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