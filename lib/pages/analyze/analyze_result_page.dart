import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class AnalyzeResultPage extends StatefulWidget {
  @override
  _AnalyzeResultPageState createState() => _AnalyzeResultPageState();
}

class _AnalyzeResultPageState extends State<AnalyzeResultPage> {
  late List<T2Favourite> mFavouriteList;

  @override
  void initState() {
    super.initState();
    mFavouriteList = getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('recommend'.tr()),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) => Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(top: 16, bottom: 16),
                itemCount: mFavouriteList.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: ValueKey(index),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xff5cd551)),
                          margin:
                              EdgeInsets.only(left: 16, right: 16, bottom: 16),
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              SlidableAction(
                                backgroundColor: Colors.transparent,
                                icon: Icons.edit,
                                foregroundColor: Colors.transparent,
                                onPressed: (context) {},
                              ),
                              RotatedBox(
                                quarterTurns: -1,
                                child: Text('Edit',
                                        style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: .5))
                                    ,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xfffd4d4b)),
                          margin:
                              EdgeInsets.only(left: 16, right: 16, bottom: 16),
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              SlidableAction(
                                backgroundColor: Colors.transparent,
                                icon: Icons.edit,
                                foregroundColor: Colors.transparent,
                                onPressed: (context) {},
                              ),
                              RotatedBox(
                                quarterTurns: -1,
                                child: Text('Remove',
                                        style: TextStyle(
                                            color: Colors.white, letterSpacing: 5.0))
                                    ,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      decoration: BoxDecoration(
                          // boxShadow: defaultBoxShadow(),
                          borderRadius: BorderRadius.circular(12)),
                      child: IntrinsicHeight(
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(color: Color(0xff5959fc), width: 10),
                              SizedBox(width: 10),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Image.asset(
                                            mFavouriteList[index].image,
                                            width: width / 5,
                                            height: 100,
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(left: 16),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                      mFavouriteList[index]
                                                              .name +
                                                          ' (' +
                                                          mFavouriteList[index]
                                                              .count
                                                              .toString() +
                                                          '개 필요)',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6,
                                                      maxLines: 2),
                                                  Text(
                                                      mFavouriteList[index]
                                                          .company,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      Text(mFavouriteList[index].details,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class T2Favourite {
  var name = '';
  int count = 0;
  var company = '';
  var image = '';
  var details = '';
}

List<T2Favourite> getFavourites() {
  var list = <T2Favourite>[];
  var model1 = T2Favourite();
  model1.name = 'ROTO 에테폰';
  model1.count = 6;
  model1.company = '(주)포이엔';
  model1.image = 'assets/images/fertilizer/4en_01.png';
  model1.details =
      '로토 에테폰은 메탄 가스 배출 저감에 특화된 제품으로 타 제품과 달리 식물 공생균을 이용하여 장기간 생태질을 안정되게 도와주는 깨끗하고 안전한 녹색기술 인증 제품입니다.';

  var model2 = T2Favourite();
  model2.name = 'ROTO Mix';
  model2.count = 10;
  model2.company = '(주)포이엔';
  model2.image = 'assets/images/fertilizer/4en_01.png';
  model2.details =
      '로토 에테폰은 토양 복원 및 배양토 제품군으로 전문 농원예 현장에서부터 가정에까지 사용할 수 있는 완벽한 토양 솔루션입니다. 메탄 가스 배출 저감에 특화된 제품인 로토 에테폰은 타 제품과 달리 식물 공생균을 이용하여 장기간 생태질을 안정되게 도와주는 깨끗하고 안전한 녹색기술 인증 제품입니다. 온실가스, 중금속 저감 기능 외에도 토양의 물리성과 화학성, 생물성을 포함한 토양의 질을 향상시키는 기능도 가지고 있습니다.';
  ;

  list.add(model1);
  list.add(model2);

  return list;
}
