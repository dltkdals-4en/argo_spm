import 'package:flutter/material.dart';

class Crop {
  String key;
  String name;
  List<Color> gradient;

  Crop({
    required this.key,
    required this.name,
    required this.gradient,
  });
}

final crops = [
  Crop(
    key: 'crop_strawberry',
    name: 'Strawberry', //딸기
    gradient: [
      Color(0xffe94057),
      Color(0xfff27121),
    ],
  ),
  Crop(
    key: 'crop_lettuce',
    name: 'Lettuce', //상추
    gradient: [
      Color(0xff00f260),
      Color(0xff0575e6),
    ],
  ),
  Crop(
    key: 'crop_tomato',
    name: 'Tomato', //토마토
    gradient: [
      Color(0xffff512f),
      Color(0xffdd2476),
    ],
  ),
  Crop(
    key: 'crop_paddy',
    name: 'Paddy', //쌀
    gradient: [
      Color(0xff832bf6),
      Color(0xffff4665),
    ],
  ),
  Crop(
    key: 'crop_groundnut',
    name: 'Groundnut', //땅콩
    gradient: [
      Color(0xffffc837),
      Color(0xffff8008),
    ],
  ),
  Crop(
    key: 'crop_sugarcane',
    name: 'Sugarcane', //사탕수수
    gradient: [
      Color(0xff2dcef8),
      Color(0xff3b40fe),
    ],
  ),
  Crop(
    key: 'crop_corn',
    name: 'Maize', //옥수수
    gradient: [
      Color(0xff009dc5),
      Color(0xff21e590),
    ],
  ),
  Crop(
    key: 'crop_blackgram',
    name: 'Black gram', //흑녹두
    gradient: [
      Color(0xffff870e),
      Color(0xffd236d2),
    ],
  ),
  Crop(
    key: 'crop_greengram',
    name: 'Green gram', //녹두
    gradient: [
      Color(0xfffe327e),
      Color(0xff5c51ff),
    ],
  ),
  Crop(
    key: 'crop_onion',
    name: 'Onion', //양파
    gradient: [
      Color(0xff2ce3f1),
      Color(0xff6143ff),
    ],
  ),
  Crop(
    key: 'crop_sesamum',
    name: 'Sesamum', //참깨
    gradient: [
      Color(0xfff1f2b5),
      Color(0xff135058),
    ],
  ),
];
