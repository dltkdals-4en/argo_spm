import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../model/report_bak.dart';

import 'app_bar_button_widget.dart';

class AppBarWidget extends StatefulWidget {
  final Report report;
  const AppBarWidget({
    Key? key,
    required this.report,
  }) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  int? _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.report.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          //brightness: Brightness.light,
        ),
      ),
      child: SliverAppBar(
        expandedHeight: 303,
        floating: false,
        pinned: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              _isFavorite! > 0 ? Icons.bookmark : Icons.bookmark_border,
            ),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
        backgroundColor: AppColors.primary,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            height: 303,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/crops/${widget.report.cropKey}.jpg',
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: 16,
                  left: 30,
                  right: 30,
                  child: ClipRect(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          width: double.infinity,
                          height: 47,
                          decoration: BoxDecoration(
                            color: Color(0xff5663ff).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: AppBarButtonWidget(
                                  iconData: Icons.gps_fixed,
                                  text: widget.report.address!,
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                child: VerticalDivider(
                                  thickness: 0.5,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              AppBarButtonWidget(
                                iconData: Icons.directions,
                                text: 'Map',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
