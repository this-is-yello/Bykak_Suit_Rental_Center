import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

var mainColor = Color(0xFF205B48);
var blackColor = Color(0xFF1E1E1E);
var greyColor = Color(0xFF9E9E9E);
var lightGreyColor = Color(0xFFEEEEEE);
var whiteColor = Color(0xFFFFFFFF);

var boldText = FontWeight.w700;

var boxShadows = BoxShadow(
  color: blackColor.withOpacity(0.5),
  blurRadius: 4,
  offset: Offset(0, 4),
);

widgetSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 360;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 560;
  } else {
    return 1000;
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

productPicHeight(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 380;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 560;
  } else {
    return 640;
  }
}

// -------------------- FontSize --------------------
h0FontSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 24;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 28;
  } else {
    return 32;
  }
}

h1FontSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 20;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 24;
  } else {
    return 28;
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

// -------------------- BoxSize --------------------
c1BoxSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 120;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 140;
  } else {
    return 160;
  }
}

c2BoxSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 100;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 120;
  } else {
    return 140;
  }
}

c3BoxSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 80;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 100;
  } else {
    return 120;
  }
}

c4BoxSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
    return 64;
  } else if (MediaQuery.of(c).size.width < 1080) {
    return 80;
  } else {
    return 100;
  }
}

c5BoxSize(c) {
  if (MediaQuery.of(c).size.width < 640) {
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
