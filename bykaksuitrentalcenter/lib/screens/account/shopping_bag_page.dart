import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

class ShoppingBagScreen extends StatefulWidget {
  const ShoppingBagScreen({super.key});

  @override
  State<ShoppingBagScreen> createState() => _ShoppingBagScreenState();
}

class _ShoppingBagScreenState extends State<ShoppingBagScreen> {

  bool _checkAllProduct = false;
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
        title: Center(child: ShoppingBagAppBar()),
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
          : ResponsiveSizer(
              builder: (context, orientation, screenType) {
                return Center(
                  child: Column(
                    children: [
                      Container(
                        width: style.widgetSize(context),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Checkbox(
                                    activeColor: style.mainColor,
                                    checkColor: style.whiteColor,
                                    value: _checkAllProduct,
                                    onChanged: (value) {
                                      setState(() {
                                        _checkAllProduct = true;
                                        // _checkProductAll = false;
                                      });

                                    },
                                  ),
                                  Text('전체선택', style: TextStyle(fontSize: 16, fontWeight: style.boldText))
                                ],
                              ),
                            ),
                            TextButton(
                              child: Text('선택삭제', style: TextStyle(color: style.blackColor, fontSize: 16, fontWeight: style.boldText)),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: style.widgetSize(context),
                        height: 2,
                        color: style.lightGreyColor,
                      ),
                      Expanded(
                        child: Container(
                          width: style.widgetSize(context),
                          child: ShoppingBagProductList(),
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
class ShoppingBagAppBar extends StatelessWidget {
  const ShoppingBagAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '장바구니',
            style:
                TextStyle(color: style.whiteColor, fontWeight: style.boldText),
          ),
          TextButton(
            child: Text('전체삭제', style: TextStyle(color: style.whiteColor,),),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}


class ShoppingBagProductList extends StatefulWidget {
  const ShoppingBagProductList({super.key});

  @override
  State<ShoppingBagProductList> createState() => _ShoppingBagProductListState();
}

class _ShoppingBagProductListState extends State<ShoppingBagProductList> {
  bool _checkProduct = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      activeColor: style.mainColor,
                      checkColor: style.whiteColor,
                      value: _checkProduct,
                      onChanged: (value) {
                        setState(() {
                          _checkProduct = true;
                          // _checkProductAll = false;
                        });

                      },
                    ),
                    TextButton(
                      child: Text('삭제', style: TextStyle(color: style.blackColor, fontSize: 16, fontWeight: style.boldText)),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('[면접대여] 블랙 솔리드 슈트', style: TextStyle(color: style.blackColor, fontSize: 18, fontWeight: style.boldText)),
                          Padding(padding: EdgeInsets.all(2)),
                          Text('50000원', style: TextStyle(color: style.blackColor, fontSize: 18, fontWeight: style.boldText)),
                          Padding(padding: EdgeInsets.all(2)),
                          Text('옵션:' + ' ' + '자켓L 바지L', style: TextStyle(fontSize: 15, color: style.greyColor)),
                          Padding(padding: EdgeInsets.all(4)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: style.mainColor,
                            ),
                            child: Text('예약하기'),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width < 1080 ? 100 : 160,
                      height: MediaQuery.of(context).size.width < 1080 ? 100 : 160,
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
        );
      },
    );
  }
}