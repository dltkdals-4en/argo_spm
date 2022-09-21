import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart' as intl;

/// [Platform] is NOT supported on Web, make a workaround.
bool get isNotIOS => kIsWeb || Platform.operatingSystem != 'ios';

/// [Platform] is NOT supported on Web, make a workaround.
bool get isNotAndroid => kIsWeb || Platform.operatingSystem != 'android';

class AppUtils {
  static bool isRTL(BuildContext context) {
    return intl.Bidi.isRtlLanguage(
        Localizations.localeOf(context).languageCode);
  }

  static String numberWithComma(int param) {
    return intl.NumberFormat('###,###,###,###')
        .format(param)
        .replaceAll(' ', '');
  }

  static String weatherConvert(int param) {
    if (param < 800) {
      return (param ~/ 100).toString();
    } else {
      if (param < 801) {
        return '8';
      } else if (param < 802) {
        return '8_1';
      } else if (param < 803) {
        return '8_2';
      } else {
        return '8_3';
      }
    }
  }

  static Color parseColor(String color) {
    var hex = color.replaceAll('#', '');
    if (hex.isEmpty) hex = 'ffffff';
    if (hex.length == 3) {
      hex =
      '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
    }
    var col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
    return col;
  }
}
