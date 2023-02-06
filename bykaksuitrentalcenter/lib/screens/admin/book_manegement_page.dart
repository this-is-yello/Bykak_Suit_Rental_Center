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
        shadowColor: Color.fromARGB(0, 0, 0, 0),
        title: Center(child: BookManegementAppBar()),
      ),
      body: ResponsiveSizer(builder: (context, orientation, screenType) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: true,
              centerTitle: true,
              automaticallyImplyLeading: false,
              expandedHeight: 140,
              toolbarHeight: 140,
              backgroundColor: style.mainColor,
              title: Column(
                children: [
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
                  Padding(padding: EdgeInsets.only(bottom: 32)),
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
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Color.fromARGB(0, 0, 0, 0),
                          context: context,
                          builder: (BuildContext context) {
                            return BookInformation();
                          }
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
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


class BookInformation extends StatefulWidget {
  const BookInformation({super.key});

  @override
  State<BookInformation> createState() => _BookInformationState();
}

class _BookInformationState extends State<BookInformation> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          width: style.widgetSize(context),
          height: 96.h,
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
              IconButton(
                icon: Icon(Icons.keyboard_double_arrow_down_rounded,
                    size: 30, color: style.blackColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8)),
              Column(
                children: [
                  Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(16),
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
                        Padding(padding: EdgeInsets.all(8)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('이름', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText)),
                            Padding(padding: EdgeInsets.only(top: 4)),
                            Text('01012345678', style: TextStyle(fontSize: style.h3FontSize(context), color: style.greyColor))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: style.widgetSize(context),
                    height: 2,
                    color: style.lightGreyColor,
                  ),
                  Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('예약번호', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText)),
                                Padding(padding: EdgeInsets.only(top: 4)),
                                Text('23020301001001', style: TextStyle(fontSize: style.h3FontSize(context), color: style.greyColor))
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: style.mainColor,
                                minimumSize: Size(80, 48)
                              ),
                              child: Text('예약변경', style: TextStyle(fontSize: style.h5FontSize(context)),),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(4)),
                        Row(
                          children: [
                            Text('대여기간', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText, color: style.blackColor)),
                            Padding(padding: EdgeInsets.all(4)),
                            Text('YY.MM.DD' + ' - ' + 'YY.MM.DD', style: TextStyle(fontSize: style.h3FontSize(context), color: style.blackColor))
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(4)),
                        Row(
                          children: [
                            Text('상담일정', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText, color: style.blackColor)),
                            Padding(padding: EdgeInsets.all(4)),
                            Text('YY.MM.DD' + ' / ' + 'HH.MM', style: TextStyle(fontSize: style.h3FontSize(context), color: style.blackColor))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: style.widgetSize(context),
                    height: 2,
                    color: style.lightGreyColor,
                  ),
                  Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          width: style.widgetSize(context),
                          child: Text(
                            '예약상품',
                            style: TextStyle(
                              fontSize: style.h3FontSize(context),
                              fontWeight: style.boldText,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          width: style.widgetSize(context),
                          height: 300,
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '[대여형태]' + ' ' + '상품이름' + ' ' + '사이즈',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]
          ),
        );
      }
    );
  }
}