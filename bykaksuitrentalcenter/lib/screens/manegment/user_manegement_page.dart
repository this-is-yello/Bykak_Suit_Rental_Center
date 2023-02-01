import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

class UserManegementScreen extends StatefulWidget {
  const UserManegementScreen({super.key});

  @override
  State<UserManegementScreen> createState() => _UserManegementScreenState();
}

class _UserManegementScreenState extends State<UserManegementScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    return Scaffold(
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
          : ResponsiveSizer(builder: (context, orientation, screenType) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  floating: true,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  expandedHeight: 180,
                  toolbarHeight: 180,
                  backgroundColor: style.mainColor,
                  title: Column(
                    children: [
                      Container(
                        width: style.widgetSize(context),
                        child: Text('회원관리', style: TextStyle(fontSize: 24, fontWeight: style.boldText)),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      Container(
                        width: style.widgetSize(context),
                        child: TextField(
                          // controller: _inputUserSearch,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: style.whiteColor,
                            prefixIcon: Icon(Icons.search, color: style.mainColor),
                            hintText: '회원의 이름이나 번호를 입력하세요.',
                            border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(8)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: style.blackColor), borderRadius: BorderRadius.circular(8)),
                          ),
                          cursorColor: style.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 12,
                    (context, index) => Center(
                      child: Container(
                        width: style.widgetSize(context),
                        padding: EdgeInsets.all(16),
                        child: InkWell(
                          child: Row(
                            children: [
                              Container(
                                width: style.c5BoxSize(context),
                                height: style.c5BoxSize(context),
                                decoration: BoxDecoration(
                                  color: style.blackColor,
                                  borderRadius: BorderRadius.circular(1000)
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: style.paddingSize(context))),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('유저이름', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText)),
                                  Padding(padding: EdgeInsets.all(2)),
                                  Text('01012345678', style: TextStyle(fontSize: style.h4FontSize(context), color: style.greyColor)),
                                ],
                              )
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          })
    );
  }
}