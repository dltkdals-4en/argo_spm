import 'package:argo_spm/pages/home/widgets/ble_conneted_widget.dart';
import 'package:argo_spm/pages/home/widgets/crops_widget.dart';
import 'package:argo_spm/providers/analyze_provider.dart';
import 'package:argo_spm/providers/ble_provider.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/empty_screen.dart';
import '../../components/section_title_widget.dart';
import '../../providers/login_provider.dart';
import '../../routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var analyze = Provider.of<AnalyzeProvider>(context);
    var ble = Provider.of<BleProvider>(context);
    var login = Provider.of<LoginProvider>(context);
    var prefs = Provider.of<PrefsProvider>(context);
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //todo 검색 위젯
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 23),
                            //   child: SearchWidget(),
                            // ),
                            SizedBox(
                              height: 25,
                            ),

                            SectionTitleWidget(
                              title: 'crops'.tr(),
                              count: 9,
                              onPressed: () {
                                // Navigator.of(context).pushNamed(Routes.crop);
                              },
                            ),
                            CropsWidget(),
                            SectionTitleWidget(
                              title: 'recent_report'.tr(),
                              count: analyze.Report.length,
                              onPressed: () {},
                            ),
                            if (analyze.Report.length < 1) EmptyScreen()
                          ],
                        ),
                    childCount: 1),
              ),
            ],
          ),
          Positioned(
            top: 5,
            right: 20,
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    await login.signOut().then((value) async {
                      await prefs.initLoginInfo().then((value) {
                        Navigator.of(context).pushNamed(Routes.root);
                      });
                    });
                  },
                  icon: Icon(Icons.logout),
                ),
                IconButton(
                  onPressed: () async {
                    print(prefs.spmState);
                  },
                  icon: Icon(Icons.menu),
                ),
                BleConnectedWidget(
                  image:
                      (ble.bleConnected) ? 'ble_connected' : 'ble_disconnected',
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.pairing);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
