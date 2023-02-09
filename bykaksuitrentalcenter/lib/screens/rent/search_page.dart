import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bykaksuitrentalcenter/screens/rent/search_result_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isLoading = true;

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
        title: Center(child: SearchAppBar()),
      ),
      body: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      width: style.widgetSize(context),
                      child: Text('카테고리', style: TextStyle(fontSize: style.h2FontSize(context), fontWeight: style.boldText,),),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      width: style.widgetSize(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: style.c3BoxSize(context),
                                  height: style.c3BoxSize(context),
                                  decoration: BoxDecoration(
                                    color: style.whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [style.boxShadows],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Container(
                                  child: Text('자켓/바지', style: TextStyle(fontSize: style.h4FontSize(context), fontWeight: style.boldText, color: style.blackColor,),),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                          InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: style.c3BoxSize(context),
                                  height: style.c3BoxSize(context),
                                  decoration: BoxDecoration(
                                    color: style.whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [style.boxShadows],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Container(
                                  child: Text('셔츠', style: TextStyle(fontSize: style.h4FontSize(context), fontWeight: style.boldText, color: style.blackColor,),),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                          InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: style.c3BoxSize(context),
                                  height: style.c3BoxSize(context),
                                  decoration: BoxDecoration(
                                    color: style.whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [style.boxShadows],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Container(
                                  child: Text('조끼', style: TextStyle(fontSize: style.h4FontSize(context), fontWeight: style.boldText, color: style.blackColor,),),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                          InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: style.c3BoxSize(context),
                                  height: style.c3BoxSize(context),
                                  decoration: BoxDecoration(
                                    color: style.whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [style.boxShadows],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Container(
                                  child: Text('잡화', style: TextStyle(fontSize: style.h4FontSize(context), fontWeight: style.boldText, color: style.blackColor,),),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      width: style.widgetSize(context),
                      child: Text('최근 검색어', style: TextStyle(fontSize: style.h2FontSize(context), fontWeight: style.boldText,),),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 20,
                    (context, index) => Center(
                      child: Container(
                        width: style.widgetSize(context),
                        height: 56,
                        child: ListTile(
                          leading: Icon(Icons.search, size: 24,),
                          title: InkWell(
                            child: Container(
                              height: 56,
                              alignment: Alignment.centerLeft,
                              child: Text('검색어'),
                            ),
                            onTap: () {},
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {},
                          ),
                        ),     
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}



// -------------------------------------------------- AppBar ---------------------------------------------------
class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: style.widgetSize(context),
      child: Container(
        height: 40,
        child: TextField(
          // controller: inputSearch,
          textInputAction: TextInputAction.go,
          onSubmitted: (value) async {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultScreen(),),);
          },
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            hintText: '검색어를 입력하세요.', // 검색어로 바뀌도록 해야합니다.
            filled: true,
            fillColor: style.whiteColor,
            border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: style.blackColor,),),
            suffixIcon: IconButton(
              icon: Icon(Icons.search, color: style.mainColor,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultScreen(),),);
              },
            ),
          ),
        ),
      ),
    );
  }
}

