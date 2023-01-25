import 'package:flutter/material.dart';

var mainColor = Color(0xFF205B48);
var blackColor = Color(0xFF1E1E1E);
var greyColor = Color(0xFF9E9E9E);
var lightGreyColor = Color(0xFFEEEEEE);
var whiteColor = Color(0xFFFFFFFF);

var boldText = FontWeight.w700;

var boxShadows = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  blurRadius: 4,
  offset: Offset(0, 4),
);

widgetSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 380;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 560;
  } else {
    return 1080;
  }
}

paddingSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 8;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 12;
  } else {
    return 16;
  }
}
