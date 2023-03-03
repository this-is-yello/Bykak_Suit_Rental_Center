import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_fade/image_fade.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:bykaksuitrentalcenter/main_page.dart';

// import 'package:cached_network_image/cached_network_image.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {  
  bool _isLoading = true;
  List productList = [];

  imgCheck() async {
    var productImg = await style.firestore.collection('productImg').doc('imgList').get();
    productList = productImg['img'];
    // print(productList);
  }
  @override
  void initState() {
    super.initState();
    imgCheck();
  }

 @override
 void dispose(){
  super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    return _isLoading
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
        return Scaffold(
          backgroundColor: style.whiteColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: style.whiteColor,
            toolbarHeight: MediaQuery.of(context).size.width < 640
              ? 56
              : MediaQuery.of(context).size.width < 1080
              ? 64
              : 72,
            title: Center(
              child: ProductsAppBar(),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                },
              ),
              child: Center(
                child: Container(
                  // width: style.widgetSize(context),
                  height: double.infinity,
                  child: GridView.builder(
                    itemCount: 22,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width < 640
                        ? 2
                        : MediaQuery.of(context).size.width < 1080
                        ? 3
                        : 4,
                      childAspectRatio: 1 / 1.2,
                      mainAxisSpacing: style.paddingSize(context),
                      crossAxisSpacing: style.paddingSize(context),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            // boxShadow: [style.boxShadows],
                            color: style.whiteColor,
                            borderRadius: BorderRadius.circular(8),
                            // border: Border.all(
                            //   color: style.greyColor,
                            //   width: 2,
                            // ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: ImageFade(
                              image: AssetImage(
                                'assets/images/products/product_(${index}).jpg'
                              ),
                              fit: BoxFit.cover,
                              errorBuilder: (context, exception) => Icon(Icons.error),
                              placeholder: Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(
                                    color: style.mainColor,
                                  ),
                                ),
                              ),
                            ),
                            // child: CachedNetworkImage(
                            //   imageUrl: '${productList[index]}',
                            //   fit: BoxFit.cover,
                            //   placeholder: (context, url) => Center(
                            //     child: SizedBox(
                            //       width: 40,
                            //       height: 40,
                            //       child: CircularProgressIndicator(
                            //         color: style.mainColor,
                            //       ),
                            //     ),
                            //   ),
                            //   errorWidget: (context, url, error) => Icon(Icons.error),
                            // ),
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Color.fromARGB(0, 0, 0, 0),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      iconSize: 30,
                                      alignment: Alignment.center,
                                      icon: Icon(
                                        Icons.close,
                                        size: 30,
                                        color: style.whiteColor,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                                content: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: InteractiveViewer(
                                          child: Image.asset(
                                            'assets/images/products/product_(${index}).jpg',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: style.c1BoxSize(context),
                                      height: style.c1BoxSize(context),
                                      child: PinchUp(),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: style.widgetSize(context),
      color: style.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            child: Text(
              'by覺 렌탈센터',
              style: TextStyle(
                fontSize: style.h1FontSize(context),
                fontWeight: style.boldText,
                color: style.mainColor,
              ),
            ),
            onTap: () {
              Get.offAllNamed('/');
            },
          ),
        ],
      ),
    );
  }
}