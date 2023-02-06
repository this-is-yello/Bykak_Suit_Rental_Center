import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';


class MySizeScreen extends StatefulWidget {
  const MySizeScreen({super.key});

  @override
  State<MySizeScreen> createState() => _MySizeScreenState();
}

class _MySizeScreenState extends State<MySizeScreen> {
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
        title: Center(child: MySizeAppBar(),),
      ),
      body: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  color: style.mainColor,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: style.whiteColor,
                    labelColor: style.whiteColor,
                    unselectedLabelColor: style.greyColor,
                    tabs: [
                      Tab(
                        text: '기본 신체지수',
                      ),
                      Tab(
                        text: '상의',
                      ),
                      Tab(
                        text: '하의',
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
                          child: MyHeightWeight(),
                        ),
                        Center(
                          child: MyUpSize(),
                        ),
                        Center(
                          child: MyDownSize(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


// -------------------------------------------------- AppBar ---------------------------------------------------
class MySizeAppBar extends StatelessWidget {
  const MySizeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '마이 사이즈',
            style:
                TextStyle(color: style.whiteColor, fontWeight: style.boldText),
          ),
        ],
      ),
    );
  }
}


// -------------------------------------------------- Contents ---------------------------------------------------
class MyHeightWeight extends StatelessWidget {
  const MyHeightWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: style.widgetSize(context),
      height: double.infinity,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('키 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewHeight,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '186', // 키 정보
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('cm',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('몸무게 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewWeight,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '80', // 키 정보
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('kg',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyUpSize extends StatelessWidget {
  const MyUpSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: style.widgetSize(context),
      height: double.infinity,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('상의총장 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewUpLength,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '60',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('cm',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('어깨너비 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewShoulder,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '500',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('cm',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('가슴둘레 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewChest,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '200',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('cm',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('소매길이 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewArmLength,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '56',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('cm',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyDownSize extends StatelessWidget {
  const MyDownSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: style.widgetSize(context),
      height: double.infinity,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('하의총장 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewUpLength,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '120',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('cm',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('허리둘레 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewShoulder,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '80',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('cm',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('엉덩이둘레 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewChest,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '90',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('cm',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('밑위 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewArmLength,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '20',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('cm',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('허벅지둘레 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewArmLength,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '60',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('cm',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('밑통 :',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: style.c1BoxSize(context),
                      ),
                      child: TextField(
                        // controller: _inputNewArmLength,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '30',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: style.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Container(
                      width: style.c1BoxSize(context),
                      child: Text('cm',
                        style: TextStyle(
                          fontSize: style.h1FontSize(context),
                          color: style.blackColor,
                          fontWeight: style.boldText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}