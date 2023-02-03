import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

class BookManegementScreen extends StatefulWidget {
  const BookManegementScreen({super.key});

  @override
  State<BookManegementScreen> createState() => _BookManegementScreenState();
}

class _BookManegementScreenState extends State<BookManegementScreen> {
  bool _isLoading= true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: style.mainColor,
      //   title: Center(child: BookManegementAppBar()),
      // ),
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
                  expandedHeight: 200,
                  toolbarHeight: 200,
                  backgroundColor: style.mainColor,
                  title: Column(
                    children: [
                      Container(
                        width: style.widgetSize(context),
                        child: Text('예약관리', style: TextStyle(fontSize: 24, fontWeight: style.boldText)),
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
                            hintText: '예약자의 이름을 입력하세요.',
                            border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(8)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: style.blackColor), borderRadius: BorderRadius.circular(8)),
                          ),
                          cursorColor: style.blackColor,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      Container(
                        width: style.widgetSize(context),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 3,
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.grey,
                                        width: 1
                                      )
                                    )
                                  ),
                                  height: 48,
                                  child: Center(child: Text('예약자', style: TextStyle(color: style.whiteColor, fontSize: 18, fontWeight: style.boldText)))
                                ),
                                onTap: () {},
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: style.lightGreyColor,
                                      width: 1
                                    )
                                  )
                                ),
                                height: 48,
                                child: Center(child: Text('전화번호', style: TextStyle(color: style.whiteColor, fontSize: 18, fontWeight: style.boldText)))
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              child: InkWell(
                                child: Container(
                                  height: 48,
                                  child: Center(child: Text('방문일정', style: TextStyle(color: style.whiteColor, fontSize: 18, fontWeight: style.boldText)))
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
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
                        padding: EdgeInsets.all(8),
                        child: InkWell(
                          child: Container(
                            height: 50,
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                    // height: 40,
                                    child: Center(child: Text('이름', style: TextStyle(fontSize: style.h5FontSize(context)),))
                                  ),
                                ),
                                Flexible(
                                  flex: 4,
                                  child: Container(
                                    // height: 40,
                                    child: Center(child: Text('010-0000-0000', style: TextStyle(fontSize: style.h5FontSize(context)),))
                                  ),
                                ),
                                Flexible(
                                  flex: 4,
                                  child: Container(
                                    // height: 40,
                                    child: Center(child: Text('22.12.13(화) 오전11:00', style: TextStyle(fontSize: style.h5FontSize(context)),))
                                  ),
                                ),
                              ],
                            ),
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


// -------------------------------------------------- AppBar ---------------------------------------------------
class BookManegementAppBar extends StatelessWidget {
  const BookManegementAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '예약관리',
            style:
                TextStyle(color: style.whiteColor, fontWeight: style.boldText),
          ),
        ],
      ),
    );
  }
}