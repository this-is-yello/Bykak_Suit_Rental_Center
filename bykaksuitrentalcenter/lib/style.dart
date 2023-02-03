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
    return 960;
  }
}

productPicHeight(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 380;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 560;
  } else {
    return 640;
  }
}

h2FontSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 18;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 20;
  } else {
    return 24;
  }
}

h3FontSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 16;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 18;
  } else {
    return 20;
  }
}

h4FontSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 14;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 16;
  } else {
    return 18;
  }
}

h5FontSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 12;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 14;
  } else {
    return 16;
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

homeGridHeight(c) {
  if(MediaQuery.of(c).size.width < 640) {
    return 750;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 1180;
  } else {
    return 1040;
  }
}

c2BoxSize(c) {
  if(MediaQuery.of(c).size.width < 640) {
    return 80;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 100;
  } else {
    return 120;
  }
}

c3BoxSize(c) {
  if(MediaQuery.of(c).size.width < 640) {
    return 80;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 100;
  } else {
    return 120;
  }
}

c4BoxSize(c) {
  if(MediaQuery.of(c).size.width < 640) {
    return 64;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 80;
  } else {
    return 100;
  }
}

c5BoxSize(c) {
  if(MediaQuery.of(c).size.width < 640) {
    return 56;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 64;
  } else {
    return 80;
  }
}

userInfoBoxHeight(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 264;
  } else {
    return 300;
  }
}