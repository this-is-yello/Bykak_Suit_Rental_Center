import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart';
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
    var productImg = await firestore.collection('productImg').doc('imgList').get();
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

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whiteColor,
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
                        ? 1
                        : MediaQuery.of(context).size.width < 1080
                        ? 2
                        : 3,
                      childAspectRatio: 1 / 1.2,
                      mainAxisSpacing: paddingSize(context),
                      crossAxisSpacing: paddingSize(context),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          width: widgetSize(context),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(8),
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
                                    color: mainColor,
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
                                        color: whiteColor,
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
                                      width: c1BoxSize(context),
                                      height: c1BoxSize(context),
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
      width: widgetSize(context),
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            child: Text(
              'by覺 렌탈센터',
              style: TextStyle(
                fontSize: h1FontSize(context),
                // fontWeight: style.boldText,
                color: mainColor,
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