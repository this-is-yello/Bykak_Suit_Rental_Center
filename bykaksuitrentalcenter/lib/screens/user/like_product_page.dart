import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bykaksuitrentalcenter/screens/rent/product_detail_page.dart';


class LikeProductScreen extends StatefulWidget {
  const LikeProductScreen({super.key});

  @override
  State<LikeProductScreen> createState() => _LikeProductScreenState();
}

class _LikeProductScreenState extends State<LikeProductScreen> {
  bool _isLoading = true;

  final _valueList = ['담은순', '낮은 가격순', '높은가격순'];
  String? _arraySelectedValue;
  void initState() {
    setState(() {
      _arraySelectedValue = _valueList[0];
    });
  }


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
        title: Center(child: LikeProductAppBar()),
      ),
      body: Center(
        child: ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding(padding: EdgeInsets.all(4)),
                Container(
                  width: style.widgetSize(context),
                  padding: EdgeInsets.only(left: 16 ,right: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              '전체' + ' ' + '0' + '개',
                              style: TextStyle(
                                fontSize: style.h4FontSize(context),
                                color: style.blackColor
                              ),
                            ),
                          ),
                          DropdownButton(
                            style: TextStyle(fontSize: style.h5FontSize(context), color: style.blackColor),
                            underline: SizedBox.shrink(),
                            value: _arraySelectedValue,
                            items: _valueList.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _arraySelectedValue = value!;
                              });
                            },
                          )
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: style.lightGreyColor,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('[예복대여] 블랙 턱시도', style: TextStyle(color: style.blackColor, fontSize: style.h4FontSize(context), fontWeight: style.boldText)),
                                          Padding(padding: EdgeInsets.all(2)),
                                          Text('대여샵', style: TextStyle(fontSize: style.h5FontSize(context), color: style.greyColor)),
                                          Padding(padding: EdgeInsets.all(4)),
                                          Row(
                                            children: [
                                              InkWell(
                                                child: Icon(Icons.favorite, color: Colors.red),
                                                onTap: () {},
                                              ),
                                              Padding(padding: EdgeInsets.all(4)),
                                              Text('25,403', style: TextStyle(color: Colors.red, fontSize: style.h5FontSize(context),),)
                                            ],
                                          )
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
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(),),);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


// -------------------------------------------------- AppBar ---------------------------------------------------
class LikeProductAppBar extends StatelessWidget {
  const LikeProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '좋아요',
            style:
              TextStyle(color: style.whiteColor, fontWeight: style.boldText),
          ),
        ],
      ),
    );
  }
}


// -------------------------------------------------- Contents ---------------------------------------------------
class LikeProductList extends StatelessWidget {
  const LikeProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: style.widgetSize(context),
            height: 200,
            color: style.greyColor,
            child: Row(
              children: [

              ],
            ),
          ),
          Expanded(
            child: Container(
              width: style.widgetSize(context),
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('[예복대여] 블랙 턱시도', style: TextStyle(color: style.blackColor, fontSize: style.h4FontSize(context), fontWeight: style.boldText)),
                                    Padding(padding: EdgeInsets.all(2)),
                                    Text('대여샵', style: TextStyle(fontSize: style.h5FontSize(context), color: style.greyColor)),
                                    Padding(padding: EdgeInsets.all(4)),
                                    Row(
                                      children: [
                                        InkWell(
                                          child: Icon(Icons.favorite, color: Colors.red),
                                          onTap: () {},
                                        ),
                                        Padding(padding: EdgeInsets.all(4)),
                                        Text('25,403', style: TextStyle(color: Colors.red, fontSize: style.h5FontSize(context),),)
                                      ],
                                    )
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
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}