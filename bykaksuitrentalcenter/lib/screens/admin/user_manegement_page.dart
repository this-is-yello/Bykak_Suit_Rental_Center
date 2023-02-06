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
        title: Center(child: UserManegementAppBar(),),
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
              expandedHeight: 120,
              toolbarHeight: 120,
              backgroundColor: style.mainColor,
              title: Column(
                children: [
                  Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(16),
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
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Color.fromARGB(0, 0, 0, 0),
                          context: context,
                          builder: (BuildContext context) {
                            return UserInformation();
                          }
                        );
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => UserInformation(),),);
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
class UserManegementAppBar extends StatelessWidget {
  const UserManegementAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '회원관리',
            style:
                TextStyle(color: style.whiteColor, fontWeight: style.boldText),
          ),
        ],
      ),
    );
  }
}


// -------------------------------------------------- Contents ---------------------------------------------------
class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
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
              Padding(padding: EdgeInsets.all(16)),
              Column(
                children: [
                  Container(
                    width: style.widgetSize(context),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: style.mainColor,
                            minimumSize: Size(80, 48)
                          ),
                          child: Text('정보수정', style: TextStyle(fontSize: style.h5FontSize(context)),),
                          onPressed: () {},
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('포인트', style: TextStyle(color: style.blackColor, fontSize: style.h3FontSize(context), fontWeight: style.boldText),),
                            Text('0' + ' ' + 'P', style: TextStyle(fontSize: style.h3FontSize(context), fontWeight: style.boldText))
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: style.mainColor,
                            minimumSize: Size(100, 48)
                          ),
                          child: Text('포인트 변경', style: TextStyle(fontSize: style.h5FontSize(context)),),
                          onPressed: () {},
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
                          children: [
                            Container(
                              child: Text(
                                '마이 사이즈',
                                style: TextStyle(
                                  fontSize: style.h3FontSize(context),
                                  fontWeight: style.boldText,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: style.mainColor,
                                minimumSize: Size(100, 48)
                              ),
                              child: Text('사이즈 수정', style: TextStyle(fontSize: style.h5FontSize(context)),),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          width: style.widgetSize(context),
                          height: MediaQuery.of(context).size.width < 640 ? 380 : MediaQuery.of(context).size.width < 1080 ? 400 : 440,
                          child: Column(
                            children: [
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '키' + ' : ' + '222' + ' ' + 'cm',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '몸무게' + ' : ' + '99' + ' ' + 'kg',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '상의총장' + ' : ' + '60' + ' ' + 'cm',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '어깨너비' + ' : ' + '500' + ' ' + 'cm',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '가슴둘레' + ' : ' + '200' + ' ' + 'cm',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '소매길이' + ' : ' + '56' + ' ' + 'cm',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '하의총장' + ' : ' + '120' + ' ' + 'cm',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '허리둘레' + ' : ' + '80' + ' ' + 'cm',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '엉덩이 둘레' + ' : ' + '90' + ' ' + 'cm',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '밑위' + ' : ' + '20' + ' ' + 'cm',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '허벅지 둘레' + ' : ' + '60' + ' ' + 'cm',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                              Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '밑통' + ' : ' + '30' + ' ' + 'cm',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
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
                            '대여이력' + ' ' + 'n' + '회',
                            style: TextStyle(
                              fontSize: style.h3FontSize(context),
                              fontWeight: style.boldText,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          width: style.widgetSize(context),
                          height: 200,
                          child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return Container(
                                width: style.widgetSize(context),
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  '22.10.06' + ' ' + 'n' + '개',
                                  style: TextStyle(
                                    fontSize: style.h4FontSize(context)
                                  ),
                                ),
                              );
                            },
                          ),
                        )
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