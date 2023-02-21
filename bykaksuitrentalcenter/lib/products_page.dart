import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:bykaksuitrentalcenter/main_page.dart';




class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  // List productPicture = [];

  // productPics() {
  //   for(int i = 1; i <= 16; i++) {
  //     productPicture.add('assets/images/products/product_(${i}).jpg');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   productPics();
  // }
  
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    return _isLoading ? 
      Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            color: style.mainColor,
          ),
        ),
      ) :
      ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          backgroundColor: style.whiteColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: style.whiteColor,
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
                  width: style.widgetSize(context),
                  height: double.infinity,
                  child: GridView.builder(
                    itemCount: 16,
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
                            // color: style.mainColor,
                            // border: Border.all(
                            //   color: style.greyColor,
                            //   width: 2,
                            // ),
                            // borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/products/product_${index}.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onHover: (value) {},
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
                                content: Container(
                                  child: InteractiveViewer(
                                    child: Image.asset(
                                      'assets/images/products/product_${index}.jpg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
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
              '순양 렌탈센터',
              style: TextStyle(
                color: style.mainColor,
                fontWeight: style.boldText,
              ),
            ),
            onTap: () {
              Get.toNamed('/');
            },
          ),
        ],
      ),
    );
  }
}