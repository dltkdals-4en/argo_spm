import 'dart:ffi';
import 'dart:math';

import 'package:argo_spm/pages/analyze/analyze_spm_order_page.dart';
import 'package:argo_spm/pages/home/widgets/nav_bar_item_widget.dart';
import 'package:argo_spm/pages/prepare/prepare_ble.dart';
import 'package:argo_spm/providers/permission_provider.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constants.dart';
import '../analyze/analyze_order_page.dart';
import '../notice/notice_page.dart';
import '../settings/settings_page.dart';
import 'home_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

  static void changeLocale(BuildContext context, Locale locale) {
    var state = context.findAncestorStateOfType<_HomeState>();
    state!.changeLanguage(locale);
  }
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _review = false;

  late PageController _controller;

  //List<Widget> _pages;
  final _pages = [
    HomePage(),
    HomePage(),
    // // FavoritePage(),
    NotificationsPage(),
    SettingsPage(),
  ];

  late AnimationController _arrowAnimationController;
  late Animation<double> _arrowAnimation;

  late AnimationController _animationController;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: _selectedIndex,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PermissionProvider>(context, listen: false).checkBlePermission(
          context);
    });
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _arrowAnimation = Tween<double>(begin: 0.0, end: pi / 4)
        .animate(_arrowAnimationController);

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _offset = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
        .animate(_animationController);
  }

  // ignore: always_declare_return_types
  changeLanguage(Locale locale) {
    // ignore: deprecated_member_use
    context.locale = locale;

    ('locale  : ${context.locale.languageCode}');
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _arrowAnimationController.dispose();
    _animationController.dispose();
  }

  // ignore: always_declare_return_types
  _selectPage(int index) {
    setState(() {
      if (_controller.hasClients) _controller.jumpToPage(index);
      _selectedIndex = index;
    });
  }

  // ignore: always_declare_return_types
  _toggleFAB() {
    FocusScope.of(context).requestFocus(FocusNode());

    _arrowAnimationController.isCompleted
        ? _arrowAnimationController.reverse()
        : _arrowAnimationController.forward();

    _animationController.isCompleted
        ? _animationController.reverse()
        : _animationController.forward();
    setState(() {
      _review = !_review;
    });
  }

  @override
  Widget build(BuildContext context) {
    var prefs = Provider.of<PrefsProvider>(context);
    prefs.spmStateCheck();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: _pages,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _offset,
              child: (prefs.spmState != 2)
                  ? PrepareBle(
                      onPressed: _toggleFAB,
                    )
                  : AnalyzeOrderPage(
                      onPressed: _toggleFAB,
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _arrowAnimationController,
        builder: (context, child) {
          switch (prefs.spmState) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
            default:
              break;
          }
          return Transform.rotate(
            angle: _arrowAnimation.value,
            child: FloatingActionButton(
              onPressed: _toggleFAB,
              backgroundColor: AppColors.primary,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        //height: 50,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(20),
        //     topRight: Radius.circular(20),
        //   ),
        //   border: Border.all(color: Color(0xfff3f3f3), width: 0.3),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Color(0x0a000000),
        //       offset: Offset(0, -11),
        //       blurRadius: 50,
        //       spreadRadius: 0,
        //     ),
        //   ],
        // ),
        child: BottomAppBar(
          elevation: 0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: NavBarItemWidget(
                  onTap: () {
                    _selectPage(0);
                  },
                  image:
                      _selectedIndex == 0 ? 'icon_home_selected' : 'icon_home',
                ),
              ),
              Expanded(
                flex: 1,
                child: NavBarItemWidget(
                  onTap: () {
                    _selectPage(1);
                  },
                  image: _selectedIndex == 1
                      ? 'icon_favorite_selected'
                      : 'icon_favorite',
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: NavBarItemWidget(
                  onTap: () {
                    _selectPage(2);
                  },
                  image: _selectedIndex == 2
                      ? 'icon_notification_selected'
                      : 'icon_notification',
                ),
              ),
              Expanded(
                flex: 1,
                child: NavBarItemWidget(
                  onTap: () {
                    _selectPage(3);
                  },
                  image: _selectedIndex == 3
                      ? 'icon_profile_selected'
                      : 'icon_profile',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
