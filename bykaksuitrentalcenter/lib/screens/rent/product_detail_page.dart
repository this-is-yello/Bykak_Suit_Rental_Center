import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

import 'package:bykaksuitrentalcenter/home_page.dart';
import 'package:bykaksuitrentalcenter/screens/rent/make_a_book_page.dart';

var numFormat = NumberFormat('###,###,###,###');

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isLoading = true;
  bool _columnState = true;

  @override
  void initState() {
    super.initState();
    productCheck();
  }

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
          // iconTheme: IconThemeData(color: style.blackColor),
          title: Center(
            child: MediaQuery.of(context).size.width < 640
                ? PhoneAppBar()
                : WideAppBar(),
          ),
        ),
        body: ListView(
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
                              style.paddingSize(context),
                            ),
                          ),
                          ProductNamePrice(),
                          Padding(
                            padding: EdgeInsets.all(
                              style.paddingSize(context),
                            ),
                          ),
                          ProductInfo(),
                          Padding(
                            padding: EdgeInsets.all(
                              style.paddingSize(context),
                            ),
                          ),
                          Review(),
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
                                    top: style.paddingSize(context),
                                  ),
                                ),
                                ProductInfo(),
                                Padding(
                                  padding: EdgeInsets.all(
                                    style.paddingSize(context),
                                  ),
                                ),
                                Review(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: style.paddingSize(context),
                            ),
                          ),
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
          onPressed: () {},
        ),
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
              width: double.infinity,
              height: style.productPicHeight(context),
              decoration: BoxDecoration(
                color: style.mainColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  '$productImage',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

// Product-Name&Price
var productShop;
var productValue;
var productName;
var productPrice;
var productImage;
var productDetailImage;
// List productImageCarousel;

productCheck() async {
  var checkProduct = await style.firestore.collection('product').get();
  
  productShop = checkProduct.docs[1]['shop'];
  productValue = checkProduct.docs[1]['productValue'];
  productName = checkProduct.docs[1]['name'];
  productPrice = checkProduct.docs[1]['price'];
  productImage = checkProduct.docs[1]['productImage'][0];
  productDetailImage = checkProduct.docs[1]['productDetailImage'];
}

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
              '$productShop',
              style: TextStyle(
                fontSize: style.h3FontSize(context),
                color: style.greyColor,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: style.paddingSize(context))),
            Text(
              '[${productValue}]' + ' ' + '$productName',
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
                  numFormat.format(productPrice) + '원',
                  style: TextStyle(
                    fontSize: style.h2FontSize(context) ,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: style.whiteColor,
                        border: Border.all(color: style.mainColor, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text('대여일정 ' + 'YY.MM.DD' + ' - ' + 'YY.MM.DD',
                          style: TextStyle(
                            fontSize: style.h5FontSize(context),
                            color: style.mainColor,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      // DateRangePicker
                    },
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  InkWell(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: style.whiteColor,
                        border: Border.all(color: style.mainColor, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text('상담시간 ' + 'YY.MM.DD' + ' / ' + 'HH.MM 오후',
                          style: TextStyle(
                            fontSize: style.h5FontSize(context),
                            color: style.mainColor,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      // DatePicker, TimePicker
                    },
                  ),
                ],
              )
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
                      color: style.whiteColor,
                    ),
                  ),
                ),
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
                  child: Text(
                    '장바구니',
                    style: TextStyle(
                      fontSize: style.h3FontSize(context),
                      color: style.mainColor
                    ),
                  ),
                ),
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
        // height: 4000,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: style.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [style.boxShadows],
        ),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(8),
          child: Image.network(
            '$productDetailImage',
            fit: BoxFit.cover,
          ),
        ),
      );
    });
  }
}
class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: style.whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [style.boxShadows],
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  '후기',
                  style: TextStyle(
                    fontSize: style.h1FontSize(context),
                    fontWeight: style.boldText,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 500, // 더보기
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: style.c5BoxSize(context),
                                  height: style.c5BoxSize(context),
                                  decoration: BoxDecoration(
                                    color: style.blackColor,
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        '유저바이각',
                                        style: TextStyle(
                                          fontSize: style.h3FontSize(context),
                                          color: style.blackColor,
                                          fontWeight: style.boldText,
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 2)),
                                    Container(
                                      child: Text(
                                        'yy.mm.dd',
                                        style: TextStyle(
                                          fontSize: style.h3FontSize(context),
                                          color: style.blackColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              '리뷰 후기의 내용이 담기겠습니다.리뷰 후기의 내용이 담기겠습니다.리뷰 후기의 내용이 담기겠습니다.리뷰 후기의 내용이 담기겠습니다.리뷰 후기의 내용이 담기겠습니다.',
                              style: TextStyle(
                                fontSize: style.h5FontSize(context),
                                color: style.blackColor,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(bottom: 16),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Container(
                                      width: style.c2BoxSize(context),
                                      height: style.c2BoxSize(context),
                                      color: style.mainColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Container(
                                      width: style.c2BoxSize(context),
                                      height: style.c2BoxSize(context),
                                      color: style.mainColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Container(
                                      width: style.c2BoxSize(context),
                                      height: style.c2BoxSize(context),
                                      color: style.mainColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Container(
                                      width: style.c2BoxSize(context),
                                      height: style.c2BoxSize(context),
                                      color: style.mainColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Container(
                                      width: style.c2BoxSize(context),
                                      height: style.c2BoxSize(context),
                                      color: style.mainColor,
                                    ),
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
              ),
              
            ],
          ),
        );
      }
    );
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
  String? _upSelectedValue;
  String? _downSelectedValue;

  void initState() {
    setState(() {
      _upSelectedValue = _valueList[3];
      _downSelectedValue = _valueList[3];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          // height: 600,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 36,
                      color: style.blackColor,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Container(
                    width: style.widgetSize(context),
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            '상의 사이즈 : ',
                            style: TextStyle(
                              fontSize: 18,
                              color: style.blackColor,
                              fontWeight: style.boldText,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          width: style.widgetSize(context) - 116,
                          child: DropdownButton(
                            isExpanded: true,
                            underline: SizedBox.shrink(),
                            style: TextStyle(fontFamily: 'Lineseed', fontSize: 18, color: style.blackColor),
                            value: _upSelectedValue,
                            items: _valueList.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _upSelectedValue = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: style.widgetSize(context),
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            '하의 사이즈 : ',
                            style: TextStyle(
                              fontSize: 18,
                              color: style.blackColor,
                              fontWeight: style.boldText),
                            ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          width: style.widgetSize(context) - 116,
                          child: DropdownButton(
                            isExpanded: true,
                            underline: SizedBox.shrink(),
                            style: TextStyle(fontFamily: 'Lineseed', fontSize: 18, color: style.blackColor),
                            value: _downSelectedValue,
                            items: _valueList.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _downSelectedValue = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Container(
                    width: style.widgetSize(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            '※평소에 입으시는 옷의 사이즈를 선택해주세요.',
                            style: TextStyle(fontSize: style.h5FontSize(context)),
                          ),
                        ),
                        Container(
                          child: Text(
                            '※고르신 사이즈와 매장에서 대여하실 옷의 사이즈는 다를 수 있습니다.',
                            style: TextStyle(fontSize: style.h5FontSize(context)),
                          ),
                        ),
                      ],
                    ),
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
                                      color: style.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              print('상의 ' + '$_upSelectedValue');
                              print('하의 ' + '$_downSelectedValue');
                              Get.to(MakeBookScreen());
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => MakeBookScreen(),
                              //   ),
                              // );
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
            ],
          ),
        );
      }
    );
  }
}
