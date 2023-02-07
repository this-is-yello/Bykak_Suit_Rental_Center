import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart' as style;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:bykaksuitrentalcenter/firebase_options.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _inputNewName = TextEditingController();
  // var _inputNewPhone = TextEditingController();
  var _inputNewId = TextEditingController();
  var _inputNewPassword = TextEditingController();
  var _inputNewPasswordCheck = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveSizer(builder: (context, orientation, screenType) {
        return ListView(
          children: [
            Container(
              height: 100.h,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '순양 렌탈센터',
                      style: TextStyle(
                          fontSize: 40,
                          color: style.blackColor,
                          fontWeight: style.boldText),
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
                          child: Text('회원정보',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: style.boldText)),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 480,
                          ),
                          child: TextField(
                            controller: _inputNewName,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: '이름',
                              labelText: '이름',
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
                        // Padding(padding: EdgeInsets.all(8)),
                        // ConstrainedBox(
                        //   constraints: BoxConstraints(
                        //     maxWidth: 480,
                        //   ),
                        //   child: TextField(
                        //     controller: _inputNewPhone,
                        //     keyboardType: TextInputType.phone,
                        //     decoration: InputDecoration(
                        //       hintText: '전화번호',
                        //       labelText: '전화번호',
                        //       floatingLabelStyle:
                        //           TextStyle(color: style.mainColor),
                        //       border: OutlineInputBorder(
                        //           borderSide: BorderSide(width: 1),
                        //           borderRadius: BorderRadius.circular(8)),
                        //       focusedBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //               width: 2, color: style.mainColor),
                        //           borderRadius: BorderRadius.circular(8)),
                        //     ),
                        //   ),
                        // ),
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
                          child: Text('계정정보',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: style.boldText)),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 480,
                          ),
                          child: TextField(
                            controller: _inputNewId,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: '이메일',
                              labelText: '이메일',
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
                            controller: _inputNewPassword,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '비밀번호',
                              labelText: '비밀번호',
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
                            controller: _inputNewPasswordCheck,
                            keyboardType: TextInputType.name,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '비밀번호 확인',
                              labelText: '비밀번호 확인',
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
                            '가입하기',
                            style:
                                TextStyle(fontSize: 24, color: style.whiteColor),
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
      }),
    );
  }
}