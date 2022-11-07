import 'dart:ui';
import 'package:argo_spm/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AppColors {
  //CO:PICK 컬러
  // static const Color primary = Color(0xFF006E51);
  // static const Color lightPrimary = Color(0xFF00A862);
  // static const Color white = Color(0xFFFFFFFF);
  // static const Color black = Color(0xFF292929);
  // static const Color blackGrey = Color(0xFF969696);
  static const Color darkGrey = Color(0xFFA8A8A8);
  // static const Color grey = Color(0xFFB7B7B7);
  static const Color lightGrey = Color(0xFFD8D8D8);
  static const Color whiteGrey = Color(0xFFE6E6E6);
  // static const Color backgroundWhite = Color(0xFFF6F6F6);
  // static const Color lightBlue = Color(0xFFE8F0FF);
  // static const Color blueGrey = Color(0xFFCBCFD6);
  // static const Color green = Color(0xFF50CF63);
  // static const Color darkGreen = Color(0xFF2DAB40);
  // static const Color yellow = Color(0xFFF3BD27);
  // static const Color lightYellow = Color(0xFFFFD411);
  // static const Color darkYellow = Color(0xFFE4AE19);
  // static const Color orange = Color(0xFFF38C27);
  // static const Color lightRed = Color(0xFFF95151);
  // static const Color red = Color(0xFFE32A2A);
  // static const Color greyBlue = Color(0xFF9BAEE4);

  //AgroDoctor 컬러
  static const primary = Color(0xff41dd9b);
  static const primaryDark = Color(0xff222455);
  static const lavenderBlue = Color(0xff848dff);
  static const blueGray = Color(0xff8a98ba);
  static const gray = Color(0xffbcbcbc);

  static const black = Color(0xff222832);
  static const darkBlack = Color(0xff1f232b);
  static const lightBlack = Color(0xff2d333d);
  static const white = Color(0xfffdfefe);
  static const darkGreen = Color(0xff3cbcb1);
  static const green = Color(0xff3fcca6);
  static const lightGreen = Color(0xff41dd9b);
  static const red = Color(0xffef3d72);
  static const oriRed = Color(0xffff0000);
  static const orange = Color(0xffff7f00);
  static const googleRed = Color(0xffea4335);
  static const blue = Color(0xff295fc6);
  static const darkBlue = Color(0xff214ea3);
  static const lightBlue = Color(0xff0075ff);
}

enum CardType {
  EMPTY,
  TASK,
  MAP,
  DONE,
}
enum UseCase {
  EMPTY,
  SUCCESS,
  FAIL,
  FAILEMPTY,
}
class fourenExternalLink {
  static const homepage = 'https://www.4en.co.kr';
  static const terms = 'https://www.4en.co.kr/policy/terms.html';
  static const privacy = 'https://www.4en.co.kr/policy/privacy.html';
  static const manual = '';
  static const googlePlayUrl = '';
  static const appStoreUrl = '';
}
makeTextStyle(double fontSize, Color? fontColor,
    [String? fontWeight, double? height]) {
  var weight = FontWeight.w500;

  switch (fontWeight) {
    case 'bold':
      weight = FontWeight.bold;
      break;
    case 'regular':
      weight = FontWeight.normal;
      break;
    default:
      break;
  }

  return TextStyle(
    fontSize: fontSize,
    fontWeight: weight,
    color: fontColor ?? AppColors.black,
    fontFamily: 'Spoqa',
    height: height,
  );
}
SizedBox BigH = SizedBox(
  height: 30,
);
SizedBox BigW = SizedBox(
  width: 30,
);
SizedBox NorH = SizedBox(
  height: 20,
);
SizedBox NorW = SizedBox(
  width: 20,
);
SizedBox SmH = SizedBox(
  height: 10,
);
SizedBox SmW = SizedBox(
  width: 10,
);

makeFToast( BuildContext context,Size size, String s){
  FToast fToast= FToast();
  fToast.init(context);
  Widget toast = Container(
    width: size.width - NORMALGAP * 2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.darkGrey,
    ),
    height: BUTTONHEIGHT,
    child: Center(
      child: Text(
        s,
        style: makeTextStyle(16, AppColors.white, 'bold'),
      ),
    ),
  );
  fToast.showToast(
    child: toast,
    positionedToastBuilder: (context, child) {
      return Positioned(
        child: child,
        bottom: 120,
        left: 20,
      );
    },
  );
}
const mainPadding = EdgeInsets.fromLTRB(20, 20, 20, 20);
const eTextStyleButton = TextStyle(
  color: AppColors.primaryDark,
  fontSize: 18,
  fontWeight: FontWeight.w400,
  fontFamily: 'Spoqa',
);

const eTextStyleSubtitle16 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontFamily: 'Spoqa',
);

const eTextStyleSubtitle14 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  fontFamily: 'Spoqa',
);

const eTextStyleSubtitle14w = TextStyle(
  color: AppColors.white,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  fontFamily: 'Spoqa',
);

const eTextStyleBody14 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Spoqa',
);

const eTextStyleHeadline20 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  fontFamily: 'Spoqa',
);

const eTextStyleHeadline28 = TextStyle(
  color: AppColors.white,
  fontSize: 28,
  fontWeight: FontWeight.bold,
  fontFamily: 'Spoqa',
);
