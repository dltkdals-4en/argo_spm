// [[[[Soil Type]]]]
// 0 : 노지 (bareground)
// 1 : 시설 (facility)

// [[[[Crop List]]]]
// crop_paddy: 쌀
// crop_groundnut : 땅콩,
// crop_sugarcane : 사탕수수,
// crop_corn : 옥수수,
// crop_blackgram : 흑녹두,
// crop_greengram : 녹두,
// crop_onion : 양파,
// crop_sesamum : 참깨,

class Report {
  int? id;
  int? userID;
  String? title;
  int? weatherID;
  String? cropKey;
  String? address;
  int? soilType; //경작지 타입
  int? soilArea; //재배면적
  String? gpsLat; //GPS 위도
  String? gpsLong; //GPS 경도
  int? score; //경작지 현재 스코어
  int? isFavorite;

  String? element0;
  String? element1;
  String? element2;
  String? element3;
  String? element4;
  String? element5;
  String? element6;
  String? element7;

  Report({
    this.id,
    this.userID,
    this.title,
    this.weatherID,
    this.cropKey,
    this.address,
    this.soilType,
    this.soilArea,
    this.gpsLat,
    this.gpsLong,
    this.score,
    this.isFavorite,
    this.element0,
    this.element1,
    this.element2,
    this.element3,
    this.element4,
    this.element5,
    this.element6,
    this.element7,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json['id'],
        userID: json['userID'],
        title: json['title'],
        weatherID: json['weatherID'],
        cropKey: json['cropKey'],
        address: json['address'],
        soilType: json['soilType'],
        soilArea: json['soilArea'],
        gpsLat: json['gpsLat'],
        gpsLong: json['gpsLong'],
        score: json['score'],
        isFavorite: json['isFavorite'],
        element0: json['element0'],
        element1: json['element1'],
        element2: json['element2'],
        element3: json['element3'],
        element4: json['element4'],
        element5: json['element5'],
        element6: json['element6'],
        element7: json['element7'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userID': userID,
        'title': title,
        'weatherID': weatherID,
        'cropKey': cropKey,
        'address': address,
        'soilType': soilType,
        'soilArea': soilArea,
        'gpsLat': gpsLat,
        'gpsLong': gpsLong,
        'score': score,
        'isFavorite': isFavorite,
        'element0': element0,
        'element1': element1,
        'element2': element2,
        'element3': element3,
        'element4': element4,
        'element5': element5,
        'element6': element6,
        'element7': element7,
      };
}
