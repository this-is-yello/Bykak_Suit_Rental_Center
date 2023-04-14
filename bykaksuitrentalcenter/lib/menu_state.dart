import 'package:flutter/material.dart';
import 'package:bykaksuitrentalcenter/style.dart';
import 'package:bykaksuitrentalcenter/about_page.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

menuState(context) {
  if (MediaQuery.of(context).size.width < 1080) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: Icon(
            Icons.menu,
            color: mainColor,
          ),
          onTap: () => SideSheet.right(
            context: context,
            width: MediaQuery.of(context).size.width * 0.6,
            body: Container(
              height: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: mainColor,
                          ),
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
                                color: lightGreyColor,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'About',
                                style: TextStyle(
                                  fontWeight: boldText,
                                  color: mainColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          currentPage = 1;
                          movePage();
                          Get.back();
                        },
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
                                color: lightGreyColor,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'LookBook',
                                style: TextStyle(
                                  fontWeight: boldText,
                                  color: mainColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          currentPage = 2;
                          movePage();
                          Get.back();
                        },
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
                                color: lightGreyColor,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Product',
                                style: TextStyle(
                                  fontWeight: boldText,
                                  color: mainColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          currentPage = 3;
                          movePage();
                          Get.back();
                        },
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
                                color: lightGreyColor,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'With',
                                style: TextStyle(
                                  fontWeight: boldText,
                                  color: mainColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          currentPage = 4;
                          movePage();
                          Get.back();
                        },
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
                                color: lightGreyColor,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                  fontWeight: boldText,
                                  color: mainColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          currentPage = 5;
                          movePage();
                          Get.back();
                        },
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
                                color: lightGreyColor,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Information',
                                style: TextStyle(
                                  fontWeight: boldText,
                                  color: mainColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          currentPage = 6;
                          movePage();
                          Get.back();
                        },
                      ),
                    ],
                  ),
                  InkWell(
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: mainColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Center(
                        child: Text(
                          '예약하기',
                          style: TextStyle(
                              fontSize: h4FontSize(context),
                              fontWeight: boldText,
                              color: mainColor),
                        ),
                      ),
                    ),
                    onTap: () async {
                      Get.back();
                      final url = Uri.parse(
                        'https://booking.naver.com/booking/13/bizes/839741',
                      );
                      if (await canLaunchUrl(url)) {
                        launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  } else {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.all(8)),
          InkWell(
            child: Text(
              'About',
              style: TextStyle(
                fontSize: 16,
                color: mainColor,
                fontWeight: boldText,
              ),
            ),
            onTap: () {
              currentPage = 1;
              movePage();
            },
          ),
          Padding(padding: EdgeInsets.all(12)),
          InkWell(
            child: Text(
              'LookBook',
              style: TextStyle(
                fontSize: 16,
                color: mainColor,
                fontWeight: boldText,
              ),
            ),
            onTap: () {
              currentPage = 2;
              movePage();
            },
          ),
          Padding(padding: EdgeInsets.all(12)),
          InkWell(
            child: Text(
              'Products',
              style: TextStyle(
                fontSize: 16,
                color: mainColor,
                fontWeight: boldText,
              ),
            ),
            onTap: () {
              currentPage = 3;
              movePage();
            },
          ),
          Padding(padding: EdgeInsets.all(12)),
          InkWell(
            child: Text(
              'With',
              style: TextStyle(
                fontSize: 16,
                color: mainColor,
                fontWeight: boldText,
              ),
            ),
            onTap: () {
              currentPage = 4;
              movePage();
            },
          ),
          Padding(padding: EdgeInsets.all(12)),
          InkWell(
            child: Text(
              'Location',
              style: TextStyle(
                fontSize: 16,
                color: mainColor,
                fontWeight: boldText,
              ),
            ),
            onTap: () {
              currentPage = 5;
              movePage();
            },
          ),
          Padding(padding: EdgeInsets.all(12)),
          InkWell(
            child: Text(
              'Information',
              style: TextStyle(
                fontSize: 16,
                color: mainColor,
                fontWeight: boldText,
              ),
            ),
            onTap: () {
              currentPage = 6;
              movePage();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: InkWell(
              child: Container(
                width: 120,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: mainColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    '예약하기',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16, fontWeight: boldText, color: mainColor),
                  ),
                ),
              ),
              onTap: () async {
                final url = Uri.parse(
                  'https://booking.naver.com/booking/13/bizes/839741',
                );
                if (await canLaunchUrl(url)) {
                  launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------- floatingActionButton --------------------------------------
class FloatActBtn extends StatefulWidget {
  const FloatActBtn({super.key});

  @override
  State<FloatActBtn> createState() => _FloatActBtnState();
}

class _FloatActBtnState extends State<FloatActBtn> {
  List hoverState = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MediaQuery.of(context).size.width < 1080
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 16),
                      child: Opacity(
                        opacity: hoverState[0],
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [boxShadows]),
                          child: Text(
                            '예약하기',
                            style: TextStyle(
                              fontWeight: boldText,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(right: 16, bottom: 16),
                        width: floatingBtnSize(context),
                        height: floatingBtnSize(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [boxShadows],
                          color: naverColor,
                        ),
                        child: Image.asset(
                          'assets/images/logos/logo_naver_white.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      onHover: (hoverVal) {
                        if (hoverVal == true) {
                          setState(() {
                            hoverState[0] = 1;
                          });
                        } else {
                          setState(() {
                            hoverState[0] = 0;
                          });
                        }
                      },
                      onTap: () async {
                        final url = Uri.parse(
                          'https://booking.naver.com/booking/13/bizes/839741',
                        );
                        if (await canLaunchUrl(url)) {
                          launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                    ),
                  ],
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 16),
                child: Opacity(
                  opacity: hoverState[1],
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [boxShadows]),
                    child: Text(
                      '카카오톡 문의',
                      style: TextStyle(
                        fontWeight: boldText,
                        color: mainColor,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: 16, bottom: 12),
                  width: floatingBtnSize(context),
                  height: floatingBtnSize(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [boxShadows],
                    color: kakaoColor,
                  ),
                  child: Image.asset(
                    'assets/images/logos/logo_kakao_talk_white.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                onHover: (hoverVal) {
                  if (hoverVal == true) {
                    setState(() {
                      hoverState[1] = 1;
                    });
                  } else {
                    setState(() {
                      hoverState[1] = 0;
                    });
                  }
                },
                onTap: () async {
                  final url = Uri.parse(
                    'http://pf.kakao.com/_WExlxixj/chat',
                  );
                  if (await canLaunchUrl(url)) {
                    launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 16),
                child: Opacity(
                  opacity: hoverState[2],
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [boxShadows]),
                    child: Text(
                      '070-7893-3059',
                      style: TextStyle(
                        fontWeight: boldText,
                        color: mainColor,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  width: floatingBtnSize(context),
                  height: floatingBtnSize(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [boxShadows],
                    color: blackColor,
                  ),
                  child: Image.asset(
                    'assets/images/logos/logo_phone_white.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                onHover: (hoverVal) {
                  if (hoverVal == true) {
                    setState(() {
                      hoverState[2] = 1;
                    });
                  } else {
                    setState(() {
                      hoverState[2] = 0;
                    });
                  }
                },
                onTap: () async {
                  final url = Uri.parse(
                    'tel:070 7893 3059',
                  );
                  if (await canLaunchUrl(url)) {
                    launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
