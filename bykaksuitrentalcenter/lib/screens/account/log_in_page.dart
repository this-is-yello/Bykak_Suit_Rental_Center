import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bykaksuitrentalcenter/firebase_options.dart';

import 'package:bykaksuitrentalcenter/screens/account/sign_up_page.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var _inputId = TextEditingController();
  var _inputPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveSizer(builder: (context, orientation, screenType) {
        return ListView(
          children: [
            Container(
              height: 100.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '순양 렌탈센터',
                      style: TextStyle(
                        fontSize: 40,
                        color: style.blackColor,
                        fontWeight: style.boldText,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 480,
                          ),
                          child: TextField(
                            controller: _inputId,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: '이메일',
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
                        Padding(padding: EdgeInsets.all(2)),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 480,
                          ),
                          child: TextField(
                            controller: _inputPassword,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '비밀번호',
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
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 480,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  child: Text('회원가입'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()));
                                  },
                                ),
                                Padding(padding: EdgeInsets.all(4)),
                                Text('/'),
                                Padding(padding: EdgeInsets.all(4)),
                                InkWell(
                                  child: Text('아이디, 비밀번호 찾기'),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                  '로그인',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: style.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(16)),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 480,
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                    height: 1,
                                    color: style.blackColor,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(4)),
                                Text('SNS계정으로 로그인하기'),
                                Padding(padding: EdgeInsets.all(4)),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                    height: 1,
                                    color: style.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(16)),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 480,
                          ),
                          child: Container(
                            child: Container(
                              height: 56,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(8)),
                              child: InkWell(
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // 카톡 아이콘으로 바꿔야합니다.
                                    Icon(Icons.messenger_sharp, color: style.blackColor,),
                                    Padding(padding: EdgeInsets.all(16)),
                                    Text(
                                      '카카오톡으로 로그인',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: style.blackColor,
                                        fontWeight: style.boldText,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
