import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bykaksuitrentalcenter/screens/rent/search_page.dart';


class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  bool _isLoading = true;

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
    : Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: style.mainColor,
        title: Center(child: SearchAppBar()),
      ),
      body: Center(
        child: Container(
          width: style.widgetSize(context),
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: 12,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.2,
              crossAxisCount: MediaQuery.of(context).size.width < 640 ? 1 : 
                  MediaQuery.of(context).size.width < 1080 ? 2 : 3,
              mainAxisSpacing: style.paddingSize(context),
              crossAxisSpacing: style.paddingSize(context),
            ),
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: style.lightGreyColor,
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: style.mainColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: style.c4BoxSize(context),
                        padding: EdgeInsets.all(style.paddingSize(context)),
                        decoration: BoxDecoration(
                          color: style.whiteColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('[대여형태] 상품명',
                              style: TextStyle(
                                fontSize: style.h4FontSize(context),
                                fontWeight: style.boldText,
                                color: style.blackColor,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: style.paddingSize(context))),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '대여샵',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context),
                                    color: style.greyColor,
                                  ),
                                ),
                                Text(
                                  '50000원',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context),
                                    color: style.mainColor,
                                    fontWeight: style.boldText,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              );
            }
          ),
        ),
      ),
    );
  }
}