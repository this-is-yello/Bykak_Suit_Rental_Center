import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bykaksuitrentalcenter/home_page.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isLoading = true;
  bool _columnState = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    if (MediaQuery.of(context).size.width < 1080) {
      setState(() {
        _columnState = true;
      });
    } else {
      setState(() {
        _columnState = false;
      });
    }

    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: style.mainColor,
          // iconTheme: IconThemeData(color: style.blackColor),
          title: Center(
            child: MediaQuery.of(context).size.width < 640
                ? PhoneAppBar()
                : WideAppBar(),
          ),
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
            : ListView(
                children: [
                  _columnState
                      ? Center(
                          child: Container(
                            width: style.widgetSize(context),
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                ProductPic(),
                                Padding(
                                    padding: EdgeInsets.all(
                                        style.paddingSize(context))),
                                ProductNamePrice(),
                                Padding(
                                    padding: EdgeInsets.all(
                                        style.paddingSize(context))),
                                ProductInfo(),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Container(
                            width: style.widgetSize(context),
                            padding: EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 4,
                                  // fit: FlexFit.tight,
                                  child: Column(
                                    children: [
                                      ProductPic(),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: style.paddingSize(context))),
                                      ProductInfo(),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: style.paddingSize(context))),
                                Flexible(
                                  flex: 2,
                                  // fit: FlexFit.tight,
                                  child: ProductNamePrice(),
                                ),
                              ],
                            ),
                          ),
                        ),
                  Padding(padding: EdgeInsets.all(style.paddingSize(context))),
                  Footer(),
                ],
              ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.headset_mic_rounded),
            backgroundColor: style.mainColor,
            onPressed: () {}),
      );
    });
  }
}


// -------------------------------------------------- Contents ---------------------------------------------------
// Product-Picture
class ProductPic extends StatelessWidget {
  const ProductPic({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        decoration: BoxDecoration(
          // color: style.whiteColor,
          // borderRadius: BorderRadius.circular(8),
          boxShadow: [style.boxShadows],
        ),
        child: CarouselSlider(
          options: CarouselOptions(
            height: style.productPicHeight(context),
            viewportFraction: 1,
            scrollDirection: Axis.horizontal,
            // autoPlay: true,
          ),
          items: [
            Container(
              height: style.productPicHeight(context),
              decoration: BoxDecoration(
                color: style.mainColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      );
    });
  }
}

// Product-Name&Price
class ProductNamePrice extends StatelessWidget {
  const ProductNamePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: style.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [style.boxShadows],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '대여샵',
              style: TextStyle(
                fontSize: style.h3FontSize(context),
                color: style.greyColor,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: style.paddingSize(context))),
            Text(
              '상품명',
              style: TextStyle(
                fontSize: style.h3FontSize(context),
                color: style.blackColor,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: style.paddingSize(context))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '50000원',
                  style: TextStyle(
                    fontSize: style.h3FontSize(context) + 4,
                    color: style.blackColor,
                    fontWeight: style.boldText,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_outline),
                        onPressed: () {},
                      ),
                      Padding(padding: EdgeInsets.only(left: 12)),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: style.paddingSize(context))),
            Container(
              width: double.infinity,
              height: 2,
              color: style.lightGreyColor,
            ),
            Padding(padding: EdgeInsets.only(top: style.paddingSize(context))),
            InkWell(
              child: Text('(0 개의 후기)',
                  style: TextStyle(
                      fontSize: style.h4FontSize(context),
                      color: style.greyColor)),
              onTap: () {},
            ),
            Padding(padding: EdgeInsets.only(top: style.paddingSize(context))),
            InkWell(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: style.mainColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Text('예약하기',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.whiteColor))),
              ),
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Color.fromARGB(0, 0, 0, 0),
                    context: context,
                    builder: (BuildContext context) {
                      return ProductBookBottomSheet();
                    });
              },
            ),
            Padding(padding: EdgeInsets.only(top: style.paddingSize(context))),
            InkWell(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: style.whiteColor,
                  border: Border.all(color: style.mainColor, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Text('장바구니',
                        style: TextStyle(
                            fontSize: style.h3FontSize(context),
                            color: style.mainColor))),
              ),
              onTap: () {},
            ),
          ],
        ),
      );
    });
  }
}

// Product-Information
class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: double.infinity,
        height: 4000,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: style.whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [style.boxShadows]),
      );
    });
  }
}

// Product-Book-BottomSheet
class ProductBookBottomSheet extends StatefulWidget {
  const ProductBookBottomSheet({super.key});

  @override
  State<ProductBookBottomSheet> createState() => _ProductBookBottomSheetState();
}

class _ProductBookBottomSheetState extends State<ProductBookBottomSheet> {
  final _valueList = ['S', 'M', 'L', '선택안함'];
  String? _upselectedValue;
  String? _downselectedValue;
  void initState() {
    setState(() {
      _upselectedValue = _valueList[3];
      _downselectedValue = _valueList[3];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: style.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.keyboard_double_arrow_down_rounded,
                size: 30, color: style.blackColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Padding(padding: EdgeInsets.all(4)),
          Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('상의 사이즈: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: style.blackColor,
                        fontWeight: style.boldText)),
                Padding(padding: EdgeInsets.all(8)),
                DropdownButton(
                  style: TextStyle(fontSize: 18),
                  value: _upselectedValue,
                  items: _valueList.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _upselectedValue = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('하의 사이즈: ',
                    style: TextStyle(
                        fontSize: 18,
                        color: style.blackColor,
                        fontWeight: style.boldText)),
                Padding(padding: EdgeInsets.all(8)),
                DropdownButton(
                  style: TextStyle(fontSize: 18),
                  value: _downselectedValue,
                  items: _valueList.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _downselectedValue = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text('※평소에 입으시는 옷의 사이즈를 선택해주세요.',
                    style: TextStyle(fontSize: 12)),
              ),
              Container(
                child: Text('※고르신 사이즈와 매장에서 대여하실 옷의 사이즈는 다를 수 있습니다.',
                    style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: style.widgetSize(context),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              height: 56,
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('상품 0개'), Text('약 0 원')],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: style.widgetSize(context),
            ),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: InkWell(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: style.mainColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: Text('예약하기',
                              style: TextStyle(
                                  fontSize: style.h3FontSize(context),
                                  color: style.whiteColor))),
                    ),
                    onTap: () {
                      print(_upselectedValue);
                      print(_downselectedValue);
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: style.paddingSize(context))),
                Flexible(
                  fit: FlexFit.tight,
                  child: InkWell(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: style.whiteColor,
                        border: Border.all(color: style.mainColor, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: Text('장바구니',
                              style: TextStyle(
                                  fontSize: style.h3FontSize(context),
                                  color: style.mainColor))),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
        ],
      ),
    );
  }
}
