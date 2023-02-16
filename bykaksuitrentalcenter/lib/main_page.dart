import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:get/get.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: style.whiteColor,
            title: Center(
              child: MainAppBar(),
            ),
          ),
        );
      },
    );
  }
}


class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  // ----------------------------------------------- MenuState ------------------------------------------------------------------
  menuState(context) {
    if (MediaQuery.of(context).size.width < 640) {
      return IconButton(
        icon: Icon(
          Icons.menu,
          color: style.mainColor,
        ),
        hoverColor: Color.fromARGB(0, 0, 0, 0),
        onPressed: () => SideSheet.right(
          context: context,
          width: MediaQuery.of(context).size.width * 0.7,
          body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_outlined,
                    ),
                    hoverColor: Color.fromARGB(0, 0, 0, 0),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: style.lightGreyColor,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: style.mainColor,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                        Text(
                          'ByKak',
                          style: TextStyle(
                            color: style.blackColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: style.lightGreyColor,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: style.mainColor,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                        Text(
                          'PRODUCTS',
                          style: TextStyle(
                            color: style.blackColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: style.lightGreyColor,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: style.mainColor,
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                        Text(
                          'CONTACTS',
                          style: TextStyle(
                            color: style.blackColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )
        ),
      );
    } else {
      return Container(
        child: Row(
          children: [
            TextButton(
              child: Text(
                'ByKak',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  // fontWeight: style.boldText,
                ),
              ),
              onPressed: () {},
            ),
            TextButton(
              child: Text(
                'PRODUCTS',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  // fontWeight: style.boldText,
                ),
              ),
              onPressed: () {},
            ),
            TextButton(
              child: Text(
                'CONTACTS',
                style: TextStyle(
                  fontSize: 16,
                  color: style.mainColor,
                  // fontWeight: style.boldText,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      );
    }
  }

  // ----------------------------------------------- MainAppBar ------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      width: style.widgetSize(context),
      height: 80,
      padding: EdgeInsets.all(16),
      color: style.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Text(
              '순양 렌탈센터',
              style: TextStyle(
                color: style.mainColor,
                fontWeight: style.boldText,
              ),
            ),
            onTap: () {},
          ),
          Container(
            child: menuState(context),
          ),
        ],
      ),
    );
  }
}