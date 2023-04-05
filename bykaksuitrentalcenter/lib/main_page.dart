import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:bykaksuitrentalcenter/style.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_fade/image_fade.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_web/video_player_web.dart';

import 'package:bykaksuitrentalcenter/menu_state.dart';
import 'package:bykaksuitrentalcenter/splash_screen.dart';
import 'package:bykaksuitrentalcenter/loading_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

int i = 0;
int currentPage = 0;
bool _isLoading = true;
var shopPic;

late Timer _timer;
late VideoPlayerController _videoController;
bool _isChanging = false;
bool _videoPlay = false;
PageController _pageController = PageController(
  initialPage: 0,
  keepPage: true,
);

movePage() {
  _pageController.animateToPage(
    currentPage,
    duration: Duration(milliseconds: 1500),
    curve: Curves.linearToEaseOut,
  );
  // print('selectedPage: ' + '$currentPage');
}

class _MainPageState extends State<MainPage> {
  void _changeState() {
    setState(() {
      _videoPlay = true;
    });
    _isChanging = true;
  }

  changeState() {
    if (i >= 9) {
      setState(() {
        i = 0;
      });
      shopPic = 'assets/images/shops/shop_${i + 1}.png';
      // print('$i, $shopPic');
    } else {
      setState(() {
        i++;
      });
      shopPic = 'assets/images/shops/shop_${i + 1}.png';
      // print('$i, $shopPic');
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      changeState();
    });
    _videoController = VideoPlayerController.asset(
      'assets/videos/bykak_video.mp4',
    )..initialize().then(
        (_) {
          setState(() {
            WidgetsBinding.instance.addPersistentFrameCallback((_) {
              _videoController.setVolume(0);
              _videoController.play();
              _videoController.setLooping(true);
            });
          });
        },
      );
    setState(() {
      i = 0;
      shopPic = 'assets/images/shops/shop_${i + 1}.png';
    });
    _changeState();
  }

  @override
  void dispose() {
    super.dispose();
    // _videoController.dispose();
    // _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whiteColor,
            toolbarHeight: MediaQuery.of(context).size.width < 640
                ? 56
                : MediaQuery.of(context).size.width < 1080
                    ? 64
                    : 72,
            title: Center(
              child: Container(
                width: widgetSize(context),
                color: whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Text(
                        'by覺 수트렌탈센터',
                        style: TextStyle(
                          fontSize: h1FontSize(context),
                          fontWeight: boldText,
                          color: mainColor,
                        ),
                      ),
                      onTap: () {
                        currentPage = 0;
                        movePage();
                      },
                    ),
                    Container(
                      child: menuState(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  controller: _pageController,
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  pageSnapping: true,
                  scrollBehavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                      PointerDeviceKind.trackpad,
                    },
                  ),
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                    // print('currentPage: ' + '$value');
                  },
                  children: [
                    ByKak(),
                    About(),
                    LookBook(),
                    Product(),
                    WithCelebrity(),
                    Location(),
                    Footer(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: currentPage >= 6
                        ? Icon(
                            Icons.keyboard_arrow_up,
                            color: whiteColor,
                            shadows: [boxShadows],
                            size: 64,
                          )
                        : Icon(
                            Icons.keyboard_arrow_down,
                            color: currentPage == 0 ? whiteColor : mainColor,
                            shadows: [boxShadows],
                            size: 64,
                          ),
                    onTap: () {
                      if (currentPage < 6) {
                        setState(() {
                          currentPage++;
                        });
                        movePage();
                      } else {
                        setState(() {
                          currentPage = 0;
                        });
                        movePage();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatActBtn(),
        );
      },
    );
  }
}

// ----------------------------------------------- ByKak ------------------------------------------------------------------
class ByKak extends StatefulWidget {
  const ByKak({super.key});

  @override
  State<ByKak> createState() => _ByKakState();
}

class _ByKakState extends State<ByKak> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: blackColor,
        ),
        child: _videoController.value.isInitialized
            ? Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Opacity(
                      opacity: 0.6,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController.value.size?.width ?? 0,
                          height: _videoController.value.size?.height ?? 0,
                          child: AspectRatio(
                            aspectRatio: _videoController.value.aspectRatio,
                            child: VideoPlayer(_videoController),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: Text(
                          'by覺 수트렌탈센터',
                          style: TextStyle(
                            fontSize: h1FontSize(context),
                            fontWeight: boldText,
                            color: whiteColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: paddingSize(context) * 2,
                          left: 16,
                          right: 16,
                          bottom: 8,
                        ),
                        child: Text(
                          'OPEN : Mon to Sat | 10:00 - 19:00',
                          style: TextStyle(
                            fontSize: h3FontSize(context),
                            color: whiteColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 100,
                        ),
                        child: Text(
                          'TEL : 070-7893-3059',
                          style: TextStyle(
                            fontSize: h3FontSize(context),
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            : Container(
                child: Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      color: whiteColor,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
      );
    });
  }
}

// ----------------------------------------------- About ------------------------------------------------------------------
class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  indexChange(a) {
    setState(() {
      i = a;
      shopPic = 'assets/images/shops/shop_${i + 1}.png';
    });
    // print('SelectedPic: ' + '$i');
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: Center(
          child: Container(
            width: widgetSize(context),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: h1FontSize(context),
                      fontWeight: boldText,
                      color: mainColor,
                    ),
                  ),
                ),
                MediaQuery.of(context).size.width < 1080
                    ? Column(
                        children: [
                          Container(
                            width: widgetSize(context),
                            child: ImageFade(
                              image: AssetImage(
                                '$shopPic',
                              ),
                              fit: BoxFit.fitWidth,
                              errorBuilder: (context, exception) =>
                                  Icon(Icons.error),
                              // placeholder: Center(
                              //   child: Container(
                              //     width: 20,
                              //     height: 20,
                              //     padding: EdgeInsets.only(top: 20),
                              //     child: CircularProgressIndicator(
                              //       color: mainColor,
                              //       strokeWidth: 2,
                              //     ),
                              //   ),
                              // ),
                              duration: Duration(milliseconds: 500),
                              syncDuration: Duration(milliseconds: 500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: paddingSize(context)),
                          ),
                          Container(
                            width: widgetSize(context),
                            height: MediaQuery.of(context).size.width < 640
                                ? 80
                                : 40,
                            child: GridView.builder(
                              itemCount: 10,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    MediaQuery.of(context).size.width < 640
                                        ? 5
                                        : 10,
                                childAspectRatio: 16 / 9,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: ImageFade(
                                    image: AssetImage(
                                      'assets/images/shops/shop_${index + 1}.png',
                                    ),
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, exception) =>
                                        Icon(Icons.error),
                                    // placeholder: Center(
                                    //   child: SizedBox(
                                    //     width: 20,
                                    //     height: 20,
                                    //     child: CircularProgressIndicator(
                                    //       color: mainColor,
                                    //       strokeWidth: 2,
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                  onTap: () {
                                    indexChange(index);
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  '그 날을 위한 자신감, 바이각',
                                  style: TextStyle(
                                    fontSize: h1FontSize(context),
                                    fontWeight: boldText,
                                    color: blackColor,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 16,
                                    bottom: 16,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '바이각 수트렌탈센터는',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: h5FontSize(context),
                                          height: 1.2,
                                          color: blackColor,
                                        ),
                                      ),
                                      Text(
                                        '300벌 이상의 렌탈복과, 100평 규모의',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: h5FontSize(context),
                                          height: 1.2,
                                          color: blackColor,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '인천 최초/최대',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: h3FontSize(context),
                                              fontWeight: boldText,
                                              height: 1.2,
                                              color: blackColor,
                                            ),
                                          ),
                                          Text(
                                            '정장렌탈 전문샵입니다.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: h5FontSize(context),
                                              height: 1.2,
                                              color: blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '웨딩, 혼주복, 면접, 데일리등으로',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: h5FontSize(context),
                                        height: 1.2,
                                        color: blackColor,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '그 날',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: h3FontSize(context),
                                            fontWeight: boldText,
                                            height: 1.2,
                                            color: blackColor,
                                          ),
                                        ),
                                        Text(
                                          '에 걸맞은 다양한 수트를 경험하세요.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: h5FontSize(context),
                                            height: 1.2,
                                            color: blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '수트,',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: h3FontSize(context),
                                              fontWeight: boldText,
                                              height: 1.2,
                                              color: blackColor,
                                            ),
                                          ),
                                          Text(
                                            '남성의 고유물이지만',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: h5FontSize(context),
                                              height: 1.2,
                                              color: blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '자주 경험하지 못하고 관심이 없던 분들이라면\n다양한 수트와 자켓을 입어보면서',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: h5FontSize(context),
                                          height: 1.2,
                                          color: blackColor,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '올바른 옷입기와',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: h5FontSize(context),
                                              height: 1.2,
                                              color: blackColor,
                                            ),
                                          ),
                                          Text(
                                            ' 자기갖춤',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: h3FontSize(context),
                                              fontWeight: boldText,
                                              height: 1.2,
                                              color: blackColor,
                                            ),
                                          ),
                                          Text(
                                            '에',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: h5FontSize(context),
                                              height: 1.2,
                                              color: blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '큰 도움이 되시리라 강하게 믿습니다.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: h5FontSize(context),
                                          height: 1.2,
                                          color: blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 550,
                                height: 350,
                                child: ImageFade(
                                  image: AssetImage(
                                    '$shopPic',
                                  ),
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, exception) =>
                                      Icon(Icons.error),
                                  // placeholder: Center(
                                  //   child: SizedBox(
                                  //     width: 20,
                                  //     height: 20,
                                  //     child: CircularProgressIndicator(
                                  //       color: mainColor,
                                  //       strokeWidth: 2,
                                  //     ),
                                  //   ),
                                  // ),
                                  duration: Duration(milliseconds: 500),
                                  syncDuration: Duration(milliseconds: 500),
                                ),
                              ),
                              Container(
                                // padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '그 날을 위한 자신감, 바이각',
                                      style: TextStyle(
                                        fontSize: h1FontSize(context),
                                        fontWeight: boldText,
                                        color: blackColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '바이각 수트렌탈센터는',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: h4FontSize(context),
                                              height: 1.2,
                                              color: blackColor,
                                            ),
                                          ),
                                          Text(
                                            '300벌 이상의 렌탈복과, 100평 규모의',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: h4FontSize(context),
                                              height: 1.2,
                                              color: blackColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '인천 최초/최대',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: h2FontSize(context),
                                                  fontWeight: boldText,
                                                  height: 1.2,
                                                  color: blackColor,
                                                ),
                                              ),
                                              Text(
                                                '정장렌탈 전문샵입니다.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: h4FontSize(context),
                                                  height: 1.2,
                                                  color: blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '웨딩, 혼주복, 면접, 데일리등으로',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: h4FontSize(context),
                                            height: 1.2,
                                            color: blackColor,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '그 날',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: h2FontSize(context),
                                                fontWeight: boldText,
                                                height: 1.2,
                                                color: blackColor,
                                              ),
                                            ),
                                            Text(
                                              '에 걸맞은 다양한 수트를 경험하세요.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: h4FontSize(context),
                                                height: 1.2,
                                                color: blackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '수트,',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontSize: h2FontSize(context),
                                                  fontWeight: boldText,
                                                  height: 1.2,
                                                  color: blackColor,
                                                ),
                                              ),
                                              Text(
                                                '남성의 고유물이지만',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontSize: h4FontSize(context),
                                                  height: 1.2,
                                                  color: blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '자주 경험하지 못하고 관심이 없던 분들이라면\n다양한 수트와 자켓을 입어보면서',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: h4FontSize(context),
                                              height: 1.2,
                                              color: blackColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '올바른 옷입기와',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontSize: h4FontSize(context),
                                                  height: 1.2,
                                                  color: blackColor,
                                                ),
                                              ),
                                              Text(
                                                ' 자기갖춤',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontSize: h2FontSize(context),
                                                  fontWeight: boldText,
                                                  height: 1.2,
                                                  color: blackColor,
                                                ),
                                              ),
                                              Text(
                                                '에',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontSize: h4FontSize(context),
                                                  height: 1.2,
                                                  color: blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '큰 도움이 되시리라 강하게 믿습니다.',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: h4FontSize(context),
                                              height: 1.2,
                                              color: blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 80,
                            padding: EdgeInsets.only(top: 16),
                            child: GridView.builder(
                              itemCount: 10,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 10,
                                childAspectRatio: 16 / 9,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: ImageFade(
                                    image: AssetImage(
                                      'assets/images/shops/shop_${index + 1}.png',
                                    ),
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, exception) =>
                                        Icon(Icons.error),
                                    // placeholder: Center(
                                    //   child: SizedBox(
                                    //     width: 20,
                                    //     height: 20,
                                    //     child: CircularProgressIndicator(
                                    //       color: mainColor,
                                    //       strokeWidth: 2,
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                  onTap: () {
                                    indexChange(index);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// ----------------------------------------------- LookBook ------------------------------------------------------------------
class LookBook extends StatefulWidget {
  const LookBook({super.key});

  @override
  State<LookBook> createState() => _LookBookState();
}

class _LookBookState extends State<LookBook> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: Center(
          child: Container(
            width: widgetSize(context),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LookBook',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontWeight: boldText,
                    color: mainColor,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  width: widgetSize(context),
                  height: lookPicHeight(context) + 20,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch,
                        PointerDeviceKind.trackpad,
                      },
                    ),
                    child: Scrollbar(
                      scrollbarOrientation: ScrollbarOrientation.bottom,
                      controller: _scrollController,
                      radius: Radius.circular(4),
                      thumbVisibility: true,
                      trackVisibility: true,
                      thickness: 12,
                      hoverThickness: 16,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController,
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              return Container(
                                height: lookPicHeight(context),
                                margin: EdgeInsets.only(right: 20, bottom: 16),
                                child: ImageFade(
                                  image: AssetImage(
                                    'assets/images/lookbooks/lookbook_${index + 1}.png',
                                  ),
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, exception) =>
                                      Icon(Icons.error),
                                  // placeholder: Padding(
                                  //   padding: const EdgeInsets.all(56),
                                  //   child: Center(
                                  //     child: SizedBox(
                                  //       width: 40,
                                  //       height: 40,
                                  //       child: CircularProgressIndicator(
                                  //         color: mainColor,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  duration: Duration(milliseconds: 500),
                                  syncDuration: Duration(milliseconds: 500),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// ----------------------------------------------- Product ------------------------------------------------------------------
class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: whiteColor,
        child: Center(
          child: Container(
            width: widgetSize(context),
            height: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontWeight: boldText,
                    color: mainColor,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  width: widgetSize(context),
                  height: MediaQuery.of(context).size.width < 640
                      ? 400
                      : MediaQuery.of(context).size.width < 1080
                          ? 420
                          : 570,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: false,
                    itemCount: MediaQuery.of(context).size.width < 640
                        ? 4
                        : MediaQuery.of(context).size.width < 1080
                            ? 6
                            : 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width < 640
                          ? 2
                          : MediaQuery.of(context).size.width < 1080
                              ? 3
                              : 4,
                      childAspectRatio: 1 / 1.2,
                      mainAxisSpacing: paddingSize(context),
                      crossAxisSpacing: paddingSize(context),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          width: widgetSize(context),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: ImageFade(
                              image: AssetImage(
                                'assets/images/products/product_(${index}).png',
                              ),
                              fit: BoxFit.cover,
                              errorBuilder: (context, exception) =>
                                  Icon(Icons.error),
                              // placeholder: Center(
                              //   child: SizedBox(
                              //     width: 40,
                              //     height: 40,
                              //     child: CircularProgressIndicator(
                              //       color: mainColor,
                              //     ),
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Color.fromARGB(0, 0, 0, 0),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      iconSize: 30,
                                      alignment: Alignment.center,
                                      icon: Icon(
                                        Icons.close,
                                        size: 30,
                                        color: whiteColor,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                                content: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: InteractiveViewer(
                                          child: Image.asset(
                                            'assets/images/products/product_(${index}).png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: c1BoxSize(context),
                                      height: c1BoxSize(context),
                                      child: PinchUp(),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Column(
                        children: [
                          Text(
                            '전체보기',
                            style: TextStyle(
                              fontSize: h3FontSize(context),
                              fontWeight: boldText,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Get.toNamed('/products');
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class PinchUp extends StatefulWidget {
  const PinchUp({super.key});

  @override
  State<PinchUp> createState() => _PinchUpState();
}

class _PinchUpState extends State<PinchUp> {
  bool _showPinchUp = true;

  showPinchUp() {
    if (_showPinchUp == true) {
      return c1BoxSize(context);
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 650), () {
      setState(() {
        _showPinchUp = false;
      });
    });

    return _showPinchUp
        ? Container(
            width: c1BoxSize(context),
            height: c1BoxSize(context),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: greyColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              'assets/images/icon_pinchUp.png',
              fit: BoxFit.contain,
            ),
          )
        : Container();
  }
}

// ----------------------------------------------- With ------------------------------------------------------------------
class WithCelebrity extends StatelessWidget {
  const WithCelebrity({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: whiteColor,
        child: Center(
          child: Container(
            width: widgetSize(context),
            // height: withPicHeight(context),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'With by覺',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontWeight: boldText,
                    color: mainColor,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  width: widgetSize(context),
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/with_celebrity.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// ----------------------------------------------- Location ------------------------------------------------------------------
class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: whiteColor,
        child: Center(
          child: Container(
            width: widgetSize(context),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: h1FontSize(context),
                    fontWeight: boldText,
                    color: mainColor,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Image.asset(
                  'assets/images/rental_center_location.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            minimumSize: Size.fromHeight(40),
                          ),
                          child: Text(
                            '바이각 수트렌탈센터 >',
                            style: TextStyle(
                              fontSize: h6FontSize(context),
                            ),
                          ),
                          onPressed: () async {
                            final url = Uri.parse(
                              'https://map.naver.com/v5/entry/place/1943136667?c=16,0,0,0,dh',
                            );
                            if (await canLaunchUrl(url)) {
                              launchUrl(url,
                                  mode: LaunchMode.externalApplication);
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: paddingSize(context),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            minimumSize: Size.fromHeight(40),
                          ),
                          child: Text(
                            '김주현바이각 제물포 본점 >',
                            style: TextStyle(
                              fontSize: h6FontSize(context),
                            ),
                          ),
                          onPressed: () async {
                            final url = Uri.parse(
                              'https://map.naver.com/v5/entry/place/36410973?c=16,0,0,0,dh',
                            );
                            if (await canLaunchUrl(url)) {
                              launchUrl(url,
                                  mode: LaunchMode.externalApplication);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            '바이각 수트렌탈센터',
                            style: TextStyle(
                              fontSize: h2FontSize(context),
                              color: blackColor,
                              fontWeight: boldText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        bottom: 8,
                      ),
                      child: Text(
                        '(22102) 인천 미추홀구 숙골로 43번길 158-19 3층',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          color: blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 2,
                  color: greyColor,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 4,
                        ),
                        child: Text(
                          '오시는 길',
                          style: TextStyle(
                            fontSize: h2FontSize(context),
                            color: blackColor,
                            fontWeight: boldText,
                          ),
                        ),
                      ),
                      Text(
                        '제물포역 2번출구 도보 1분',
                        style: TextStyle(
                          fontSize: h5FontSize(context),
                          color: blackColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                        ),
                        child: Text(
                          '[37502] 제물포역(스마트타운 방면) 버스정류장 도보 3분',
                          style: TextStyle(
                            fontSize: h5FontSize(context),
                            color: blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  color: greyColor,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 4,
                            ),
                            child: Text(
                              '주차안내',
                              style: TextStyle(
                                fontSize: h2FontSize(context),
                                color: blackColor,
                                fontWeight: boldText,
                              ),
                            ),
                          ),
                          Text(
                            '김주현바이각 제물포 본점 / 제물포북부역 공영주차장 2시간 무료',
                            style: TextStyle(
                              fontSize: h5FontSize(context),
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// ----------------------------------------------- Footer ------------------------------------------------------------------
class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

bool _snsState = true;

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: mainColor,
        ),
        child: Center(
          child: Container(
            width: widgetSize(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, bottom: 16),
                      child: InkWell(
                        child: Row(
                          children: [
                            Text(
                              'by覺 수트렌탈센터',
                              style: TextStyle(
                                fontSize: _snsState
                                    ? h2FontSize(context)
                                    : h4FontSize(context),
                                color: whiteColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 16),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            _snsState = true;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: InkWell(
                        child: Row(
                          children: [
                            Text(
                              'K!mjuhyeon by覺',
                              style: TextStyle(
                                fontSize: _snsState
                                    ? h4FontSize(context)
                                    : h2FontSize(context),
                                color: whiteColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            _snsState = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                // Padding(
                //   padding: EdgeInsets.all(16),
                //   child: InkWell(
                //     child: Text(
                //       'by覺 수트렌탈센터',
                //       style: TextStyle(
                //         fontSize: h1FontSize(context),
                //         color: whiteColor,
                //       ),
                //     ),
                //     onTap: () {
                //       currentPage = 0;
                //       movePage();
                //       Get.back();
                //     },
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(16),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       InkWell(
                //         child: Image.asset(
                //           'assets/images/logos/logo_kakao_talk.png',
                //           fit: BoxFit.contain,
                //           scale: 1.5,
                //         ),
                //         onTap: () async {
                //           final url = Uri.parse(
                //             'http://pf.kakao.com/_WExlxixj',
                //           );
                //           if (await canLaunchUrl(url)) {
                //             launchUrl(
                //               url,
                //               mode: LaunchMode.externalApplication,
                //             );
                //           }
                //         },
                //       ),
                //       InkWell(
                //         child: Image.asset(
                //           'assets/images/logos/logo_instagram.png',
                //           fit: BoxFit.contain,
                //           scale: 1.5,
                //         ),
                //         onTap: () async {
                //           final url = Uri.parse(
                //             'https://instagram.com/bykak_rental?igshid=YmMyMTA2M2Y=',
                //           );
                //           if (await canLaunchUrl(url)) {
                //             launchUrl(
                //               url,
                //               mode: LaunchMode.externalApplication,
                //             );
                //           }
                //         },
                //       ),
                //       InkWell(
                //         child: Image.asset(
                //           'assets/images/logos/logo_naver.png',
                //           fit: BoxFit.contain,
                //           scale: 1.5,
                //         ),
                //         onTap: () async {
                //           final url = Uri.parse(
                //             'https://map.naver.com/v5/entry/place/1943136667?lng=126.6570986&lat=37.4671237&placePath=%2Fhome%3Fentry=plt&c=15,0,0,0,dh',
                //           );
                //           if (await canLaunchUrl(url)) {
                //             launchUrl(
                //               url,
                //               mode: LaunchMode.externalApplication,
                //             );
                //           }
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.all(16),
                //   child: InkWell(
                //     child: Text(
                //       'K!mjuhyeon by覺',
                //       style: TextStyle(
                //         fontSize: h1FontSize(context),
                //         color: whiteColor,
                //       ),
                //     ),
                //     onTap: () async {
                //       final url = Uri.parse(
                //         'http://www.bykak.com/html/',
                //       );
                //       if (await canLaunchUrl(url)) {
                //         launchUrl(
                //           url,
                //           mode: LaunchMode.externalApplication,
                //         );
                //       }
                //     },
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(16),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       InkWell(
                //         child: Image.asset(
                //           'assets/images/logos/logo_kakao_talk.png',
                //           fit: BoxFit.contain,
                //           scale: 1.5,
                //         ),
                //         onTap: () async {
                //           final url = Uri.parse(
                //             'http://pf.kakao.com/_UxoHxbT',
                //           );
                //           if (await canLaunchUrl(url)) {
                //             launchUrl(
                //               url,
                //               mode: LaunchMode.externalApplication,
                //             );
                //           }
                //         },
                //       ),
                //       InkWell(
                //         child: Image.asset(
                //           'assets/images/logos/logo_blog.png',
                //           fit: BoxFit.contain,
                //           scale: 1.5,
                //         ),
                //         onTap: () async {
                //           final url = Uri.parse(
                //             'https://blog.naver.com/kimjuhyeon_',
                //           );
                //           if (await canLaunchUrl(url)) {
                //             launchUrl(
                //               url,
                //               mode: LaunchMode.externalApplication,
                //             );
                //           }
                //         },
                //       ),
                //       InkWell(
                //         child: Image.asset(
                //           'assets/images/logos/logo_instagram.png',
                //           fit: BoxFit.contain,
                //           scale: 1.5,
                //         ),
                //         onTap: () async {
                //           final url = Uri.parse(
                //             'https://www.instagram.com/kimjuhyeon_by_kak/',
                //           );
                //           if (await canLaunchUrl(url)) {
                //             launchUrl(
                //               url,
                //               mode: LaunchMode.externalApplication,
                //             );
                //           }
                //         },
                //       ),
                //       InkWell(
                //         child: Image.asset(
                //           'assets/images/logos/logo_youtube.png',
                //           fit: BoxFit.contain,
                //           scale: 1.5,
                //         ),
                //         onTap: () async {
                //           final url = Uri.parse(
                //             'https://www.youtube.com/channel/UChLYML6MnztkeOYdtdAQqaw',
                //           );
                //           if (await canLaunchUrl(url)) {
                //             launchUrl(
                //               url,
                //               mode: LaunchMode.externalApplication,
                //             );
                //           }
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                FooterSns(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '회사명 : (주) 데시그너',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '사업자등록번호 : 720-86-02241',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '인천광역시 미추홀구 숙골로 43번길 158-19 3층',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '우편번호 : 22102',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '전화번호 : 070-7893-3059',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Copyright ⓒ 2023 by Designer',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: h4FontSize(context),
                              fontWeight: lightText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class FooterSns extends StatelessWidget {
  const FooterSns({super.key});
  @override
  Widget build(BuildContext context) {
    return _snsState
        ? Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Image.asset(
                    'assets/images/logos/logo_kakao_talk.png',
                    fit: BoxFit.contain,
                    scale: 1.5,
                  ),
                  onTap: () async {
                    final url = Uri.parse(
                      'http://pf.kakao.com/_WExlxixj',
                    );
                    if (await canLaunchUrl(url)) {
                      launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                ),
                InkWell(
                  child: Image.asset(
                    'assets/images/logos/logo_instagram.png',
                    fit: BoxFit.contain,
                    scale: 1.5,
                  ),
                  onTap: () async {
                    final url = Uri.parse(
                      'https://instagram.com/bykak_rental?igshid=YmMyMTA2M2Y=',
                    );
                    if (await canLaunchUrl(url)) {
                      launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                ),
                InkWell(
                  child: Image.asset(
                    'assets/images/logos/logo_naver.png',
                    fit: BoxFit.contain,
                    scale: 1.5,
                  ),
                  onTap: () async {
                    final url = Uri.parse(
                      'https://map.naver.com/v5/entry/place/1943136667?lng=126.6570986&lat=37.4671237&placePath=%2Fhome%3Fentry=plt&c=15,0,0,0,dh',
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
          )
        : Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Image.asset(
                    'assets/images/logos/logo_kakao_talk.png',
                    fit: BoxFit.contain,
                    scale: 1.5,
                  ),
                  onTap: () async {
                    final url = Uri.parse(
                      'http://pf.kakao.com/_UxoHxbT',
                    );
                    if (await canLaunchUrl(url)) {
                      launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                ),
                InkWell(
                  child: Image.asset(
                    'assets/images/logos/logo_blog.png',
                    fit: BoxFit.contain,
                    scale: 1.5,
                  ),
                  onTap: () async {
                    final url = Uri.parse(
                      'https://blog.naver.com/kimjuhyeon_',
                    );
                    if (await canLaunchUrl(url)) {
                      launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                ),
                InkWell(
                  child: Image.asset(
                    'assets/images/logos/logo_instagram.png',
                    fit: BoxFit.contain,
                    scale: 1.5,
                  ),
                  onTap: () async {
                    final url = Uri.parse(
                      'https://www.instagram.com/kimjuhyeon_by_kak/',
                    );
                    if (await canLaunchUrl(url)) {
                      launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                ),
                InkWell(
                  child: Image.asset(
                    'assets/images/logos/logo_youtube.png',
                    fit: BoxFit.contain,
                    scale: 1.5,
                  ),
                  onTap: () async {
                    final url = Uri.parse(
                      'https://www.youtube.com/channel/UChLYML6MnztkeOYdtdAQqaw',
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
          );
  }
}
