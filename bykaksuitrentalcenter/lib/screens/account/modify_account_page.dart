import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';

class ModifyAccountScreen extends StatefulWidget {
  const ModifyAccountScreen({super.key});

  @override
  State<ModifyAccountScreen> createState() => _ModifyAccountScreenState();
}

class _ModifyAccountScreenState extends State<ModifyAccountScreen> {
  bool _isLoading= true;

  var _inputModifyName = TextEditingController();
  var _inputModifyPhone = TextEditingController();
  var _inputModifyPassword = TextEditingController();
  var _inputModifyPasswordCheck = TextEditingController();
  
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
        title: Center(child: ModifyAccountAppBar()),
      ),
      body: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return ListView(
            children: [
              Container(
                width: style.widgetSize(context),
                height: 100.h,
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 480,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text(
                              '프로필 사진',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: style.boldText,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 480,
                            ),
                            child: InkWell(
                              child: Container(
                                width: 240,
                                height: 240,
                                decoration: BoxDecoration(
                                  color: style.blackColor,
                                  borderRadius: BorderRadius.circular(1000),
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(16)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 480,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text(
                              '회원정보',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: style.boldText,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 480,
                            ),
                            child: TextField(
                              controller: _inputModifyName,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: '유저바이각',
                                floatingLabelStyle:
                                    TextStyle(color: style.mainColor),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(8)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: style.mainColor),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 480,
                      ),
                      child: TextField(
                        controller: _inputModifyPhone,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: '01012123434',
                          floatingLabelStyle:
                              TextStyle(color: style.mainColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: style.mainColor),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(16)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 480,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text('계정정보',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: style.boldText)),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 480,
                            ),
                            child: Container(
                              child: Text('이메일 아이디 :' + ' ' + 'user@test.com', style: TextStyle(fontSize: 20),),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 480,
                            ),
                            child: TextField(
                              controller: _inputModifyPassword,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: '비밀번호',
                                floatingLabelStyle:
                                    TextStyle(color: style.mainColor),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(8)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: style.mainColor),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 480,
                            ),
                            child: TextField(
                              controller: _inputModifyPasswordCheck,
                              keyboardType: TextInputType.name,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: '비밀번호 확인',
                                floatingLabelStyle:
                                    TextStyle(color: style.mainColor),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(8)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: style.mainColor),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(16)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 480,
                      ),
                      child: InkWell(
                        child: Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: style.mainColor,
                          ),
                          child: Center(
                            child: Text(
                              '정보수정하기',
                              style:
                                  TextStyle(fontSize: 20, color: style.whiteColor),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
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
class ModifyAccountAppBar extends StatelessWidget {
  const ModifyAccountAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: style.widgetSize(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '계정정보수정',
            style:
              TextStyle(
                color: style.whiteColor,
                fontWeight: style.boldText,
            ),
          ),
        ],
      ),
    );
  }
}