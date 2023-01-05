import 'package:argo_spm/pages/report/widgets/app_bar_widget.dart';
import 'package:charcode/html_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';


import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../components/label_crop.dart';
import '../../components/score_text_container.dart';
import '../../components/section_title_widget.dart';
import '../../constants/constants.dart';
import '../../model/report_bak.dart';
import '../../model/sample_view.dart';
import '../../routes/routes.dart';


class ReportDetailsPage extends StatelessWidget {
  final Report report;

  const ReportDetailsPage({
    Key? key,
    required this.report,
  }) : super(key: key);

  List<GridColumn> getColumns() {
    final textStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(255, 255, 255, 1));
    return <GridColumn>[
      GridTextColumn(
        columnName: 'elementName',
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            '주요 성분',
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridTextColumn(
        columnName: 'elementValue',
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            '검출량',
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ];
  }

  SfDataGridTheme _buildDataGrid() {
    return SfDataGridTheme(
      data: SfDataGridThemeData(
          headerHoverColor: Colors.white.withOpacity(0.3),
          headerColor: AppColors.darkGreen),
      child: SfDataGrid(
        source: _StylingDataGridSource(),
        verticalScrollPhysics: NeverScrollableScrollPhysics(),
        columnWidthMode: ColumnWidthMode.fill,
        gridLinesVisibility: GridLinesVisibility.both,
        columns: getColumns(),
      ),
    );
  }

  BoxDecoration drawBorder() {
    final borderSide =
        BorderSide(width: 1.0, color: const Color.fromRGBO(0, 0, 0, 0.26));
    return BoxDecoration(
        border:
            Border(left: borderSide, right: borderSide, bottom: borderSide));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  AppBarWidget(
                    report: report,
                  ),
                ];
              },
              body: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                report.title!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              LabelCrops(
                                cropKey: report.cropKey!,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              RatingTextContainer(rating: 4.5),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: report.cropKey!.tr(),
                                  style: TextStyle(
                                    color: AppColors.lightBlack,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                // TextSpan(
                                //   text: ' ${'daily_time'.tr()} ',
                                //   style: TextStyle(
                                //     color: AppColors.gray,
                                //     fontSize: 13,
                                //     fontWeight: FontWeight.w400,
                                //     fontStyle: FontStyle.normal,
                                //   ),
                                // ),
                                // TextSpan(
                                //   text: '2020년 4월 15일 오전 11:10',
                                //   style: TextStyle(
                                //     color: AppColors.lavenderBlue,
                                //     fontSize: 13,
                                //     fontWeight: FontWeight.w400,
                                //     fontStyle: FontStyle.normal,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SectionTitleWidget(
                      title: 'elements_summary'.tr(),
                      count: 0,
                      onPressed: () {
                        //Navigator.of(context).pushNamed(Routes.photos);
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      height: 400,
                      child: _buildCustomizedRadialBarChart(),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SectionTitleWidget(
                      title: '주요 성분 필요량',
                      count: 0,
                      onPressed: () {
                        // Navigator.of(context).pushNamed(Routes.profileReviews);
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 120,
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                              )
                            ],
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 16),
                              SvgPicture.asset(getListData()[0].icon,
                                  width: width / 13, height: width / 13),
                              SizedBox(height: 10),
                              Text(
                                getListData()[0].name,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .textTheme
                                    ?.headline6,
                              ),
                              SizedBox(height: 7),
                              Text(
                                getListData()[0].date,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .textTheme
                                    ?.subtitle1,
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: getListData()[0].isPaid
                                    ? BoxDecoration(
                                        color: AppColors.lightGreen,
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      )
                                    : BoxDecoration(
                                        color: Color(0xfff06263),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                child: Text(
                                  getListData()[0].isPaid ? '적정' : '보충필요',
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                        Container(
                          width: 120,
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                              )
                            ],
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 16),
                              SvgPicture.asset(getListData()[1].icon,
                                  width: width / 13, height: width / 13),
                              SizedBox(height: 10),
                              Text(
                                getListData()[1].name,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .textTheme
                                    ?.headline6,
                              ),
                              SizedBox(height: 7),
                              Text(
                                getListData()[1].date,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .textTheme
                                    ?.subtitle1,
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: getListData()[1].isPaid
                                    ? BoxDecoration(
                                        color: AppColors.lightGreen,
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      )
                                    : BoxDecoration(
                                        color: Color(0xfff06263),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                child: Text(
                                  getListData()[1].isPaid ? '적정' : '보충필요',
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                        Container(
                          width: 120,
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                              )
                            ],
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 16),
                              SvgPicture.asset(getListData()[2].icon,
                                  width: width / 13, height: width / 13),
                              SizedBox(height: 10),
                              Text(
                                getListData()[2].name,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .textTheme
                                    ?.headline6,
                              ),
                              SizedBox(height: 7),
                              Text(
                                getListData()[2].date,
                                style: Theme.of(context)
                                    .appBarTheme
                                    .textTheme
                                    ?.subtitle1,
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: getListData()[2].isPaid
                                    ? BoxDecoration(
                                        color: AppColors.lightGreen,
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      )
                                    : BoxDecoration(
                                        color: Color(0xfff06263),
                                        border: Border.all(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                child: Text(
                                  getListData()[2].isPaid ? '적정' : '보충필요',
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    SectionTitleWidget(
                      title: 'data_analyze'.tr(),
                      count: 0,
                      onPressed: () {
                        // Navigator.of(context).pushNamed(Routes.profileReviews);
                      },
                    ),
                    Container(
                      // height: 415,
                      color: Color(0xFFFAFAFA),
                      child: Card(
                        margin: const EdgeInsets.all(16.0),
                        clipBehavior: Clip.antiAlias,
                        elevation: 1.0,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Container(
                            decoration: drawBorder(),
                            child: _buildDataGrid(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.analyzeResult);
              },
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                width: double.infinity,
                height: 55,
                child: Center(
                  child: Text(
                    'fertilizer_optimization'.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SfCircularChart _buildCustomizedRadialBarChart() {
    final dataSources = <ChartSampleData>[
      ChartSampleData(
          x: 'N (질소)',
          y: 22.45          ,
          text: '100%',
          pointColor: const Color.fromRGBO(69, 186, 161, 1.0)),
      ChartSampleData(
          x: 'P(인)',
          y: 74.6,
          text: '100%',
          pointColor: const Color.fromRGBO(230, 135, 111, 1.0)),
      ChartSampleData(
          x: 'OM (유기물)',
          y: 132,
          text: '100%',
          pointColor: const Color.fromRGBO(145, 132, 202, 1.0)),

    ];

    final _annotationSources = <CircularChartAnnotation>[
      CircularChartAnnotation(
        angle: 0,
        radius: '0%',
        widget: Container(
          child: Text(
            'N',
            style: TextStyle(
              color: const Color.fromRGBO(69, 186, 161, 1.0),
            ),
          ),
        ),
      ),
      CircularChartAnnotation(
        angle: 0,
        radius: '0%',
        widget: Container(
          child: Text(
            'P',
            style: TextStyle(
              color: const Color.fromRGBO(230, 135, 111, 1.0),
            ),
          ),
        ),
      ),
      CircularChartAnnotation(
        angle: 0,
        radius: '0%',
        widget: Container(
          child: Text(
            'OM',
            style: TextStyle(color: const Color.fromRGBO(145, 132, 202, 1.0)),
          ),
        ),
      ),
      CircularChartAnnotation(
        angle: 0,
        radius: '0%',
        widget: Container(
          child: Text(
            'P',
            style: TextStyle(color: const Color.fromRGBO(145, 132, 202, 1.0)),
          ),
        ),
      ),
    ];

    const colors = <Color>[
      Color.fromRGBO(69, 186, 161, 1.0),
      Color.fromRGBO(230, 135, 111, 1.0),
      Color.fromRGBO(145, 132, 202, 1.0),
    ];

    return SfCircularChart(
      legend: Legend(
        backgroundColor: Colors.white,
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
        orientation: LegendItemOrientation.horizontal,
        itemPadding: 0,
        legendItemBuilder:
            (String name, dynamic series, dynamic point, int index) {
          return Container(
              height: 50,
              width: 150,
              child: Row(children: <Widget>[
                Container(
                    height: 55,
                    width: 60,
                    child: SfCircularChart(
                      annotations: <CircularChartAnnotation>[
                        _annotationSources[index],
                      ],
                      series: <RadialBarSeries<ChartSampleData, String>>[
                        RadialBarSeries<ChartSampleData, String>(
                            animationDuration: 0,
                            dataSource: <ChartSampleData>[dataSources[index]],
                            maximumValue: 100,
                            radius: '100%',
                            cornerStyle: CornerStyle.bothCurve,
                            xValueMapper: (ChartSampleData data, _) => point.x,
                            yValueMapper: (ChartSampleData data, _) => data.y,
                            pointColorMapper: (ChartSampleData data, _) =>
                                data.pointColor,
                            innerRadius: '70%',
                            pointRadiusMapper: (ChartSampleData data, _) =>
                                data.text),
                      ],
                    )),
                Container(
                    width: 80,
                    child: Text(
                      point.x,
                      style: TextStyle(
                          color: colors[index], fontWeight: FontWeight.bold),
                    )),
              ]));
        },
      ),
      series: _getRadialBarCustomizedSeries(),
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          angle: 0,
          radius: '0%',
          height: '100%',
          width: '100%',
          widget: Container(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Center(
                  child: Text(
                '분석 결과',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }

  /// Returns radial bar which need to be customized.
  List<RadialBarSeries<ChartSampleData, String>>
      _getRadialBarCustomizedSeries() {
    final chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'N (질소)',
          y: 22.45          ,
          text: '100%',
          pointColor: const Color.fromRGBO(69, 186, 161, 1.0)),
      ChartSampleData(
          x: 'P(인)',
          y: 74.6,
          text: '100%',
          pointColor: const Color.fromRGBO(230, 135, 111, 1.0)),
      ChartSampleData(
          x: 'OM (유기물)',
          y: 132,
          text: '100%',
          pointColor: const Color.fromRGBO(145, 132, 202, 1.0)),
    ];

    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
        animationDuration: 0,
        maximumValue: 100,
        gap: '10%',
        radius: '100%',
        dataSource: chartData,
        cornerStyle: CornerStyle.bothCurve,
        innerRadius: '50%',
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.y,
        pointRadiusMapper: (ChartSampleData data, _) => data.text,

        /// Color mapper for each bar in radial bar series,
        /// which is get from datasource.
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        legendIconType: LegendIconType.circle,
      ),
    ];
  }
}

class T5Bill {
  var name;
  var date;
  var isPaid = false;
  var icon;
}

List<T5Bill> getListData() {
  var list = <T5Bill>[];
  var bill = T5Bill();
  bill.name = 'N';
  bill.icon = 'assets/images/light_bulb.svg';
  bill.isPaid = true;
  bill.date = '6.23';
  list.add(bill);

  var bill1 = T5Bill();
  bill1.name = 'P';
  bill1.icon = 'assets/images/light_bulb.svg';
  bill1.isPaid = false;
  bill1.date = '46.57';
  list.add(bill1);

  var bill2 = T5Bill();
  bill2.name = 'OM';
  bill2.icon = 'assets/images/light_bulb.svg';
  bill2.isPaid = true;
  bill2.date = '4.06';
  list.add(bill2);
  return list;
}

class _Employee {
  _Employee(this.elementName, this.elementValue);
  final String elementName;
  final double elementValue;
}

class _StylingDataGridSource extends DataGridSource {
  _StylingDataGridSource() {
    employees = getEmployees();
    buildDataGridRows();
  }
  List<_Employee> employees = [];
  List<DataGridRow> dataGridRows = [];

  /// Build DataGridRow collection
  void buildDataGridRows() {
    dataGridRows = employees.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell(
          columnName: 'elementName',
          value: dataGridRow.elementName,
        ),
        DataGridCell(
          columnName: 'elementValue',
          value:
              dataGridRow.elementValue <= 0 ? '미검출' : dataGridRow.elementValue,
        ),
      ]);
    }).toList(growable: true);
  }

  // Overrides
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final rowIndex = dataGridRows.indexOf(row);
    var backgroundColor = Colors.transparent;

    if ((rowIndex % 2) == 0) {
      backgroundColor = AppColors.primary.withOpacity(0.07);
    }

    return DataGridRowAdapter(color: backgroundColor, cells: [
      Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          row.getCells()[1].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }

  // _Employee data sets
  List<_Employee> getEmployees() {
    final employeeData = <_Employee>[];
    // employeeData.add(_Employee(
    //   'pH',
    //   5.32,
    // ));
    // employeeData.add(_Employee(
    //   'EC',
    //   1.04,
    // ));
    employeeData.add(_Employee(
      'NO3' + String.fromCharCode($sup2),
      6.23,
    ));
    employeeData.add(_Employee(
      'P(유효인산)',
      46.57,
    ));
    employeeData.add(_Employee(
      'OM(유기물)',
      4.06,
    ));
    // employeeData.add(_Employee(
    //   'Ca+Mg',
    //   0,
    // ));
    return employeeData;
  }
}
