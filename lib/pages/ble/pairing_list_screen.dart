import 'package:argo_spm/providers/ble_provider.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:argo_spm/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../constants/screen_size.dart';

class PairingListScreen extends StatelessWidget {
  const PairingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ble = Provider.of<BleProvider>(context);

    var size = MediaQuery.of(context).size;

    var pairingDevices = ble.pairingList;
    var prefs = Provider.of<PrefsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('페어링 기기 목록'),
        actions: [
          IconButton(
            onPressed: () {
              // bleProvider.initPairingDevices();
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              print(ble.recentBle);
              // bleProvider.initPairingDevices();
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              color: AppColors.white,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (ble.recentBle) ? '현재 연결되어 있는 기기' : '최근에 연결한 기기',
                      style: makeTextStyle(18, AppColors.black, 'bold'),
                    ),
                    Row(
                      children: [
                        Text(
                          '${ble.deviceName}',
                          style: makeTextStyle(16, AppColors.black, 'bold'),
                        ),
                        NorW,
                        (!ble.recentBle) ?ElevatedButton(
                          onPressed: () async {
                            print(ble.recentBle);
                            await prefs.getSavedDeviceAddress().then((value) {
                              var device = pairingDevices.firstWhere(
                                  (element) => element.address == value);
                              ble.setRecent(
                                  context, value, size, device, prefs);
                            });
                          },
                          child: Text( '연결하기'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary),
                        ):Container(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: AppColors.darkGrey,
            ),
            Container(
              width: size.width,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  '연결하려는 기기가 켜져있는지 확인 후, \n기기 연결 버튼을 클릭해주세요.',
                  style: makeTextStyle(18, AppColors.black, 'bold'),
                ),
              ),
              color: AppColors.white,
            ),
            Container(
              width: size.width,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  '페어링된 기기 수 : ${pairingDevices.length} 개',
                  style: makeTextStyle(18, AppColors.black, 'bold'),
                ),
              ),
              color: AppColors.white,
            ),
            SmH,
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${pairingDevices[index].name}'),
                      subtitle: Text('${pairingDevices[index].address}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          print('pressed');
                          ble
                              .connectBle(
                                  context, size, pairingDevices[index], prefs)
                              .then((value) => Navigator.pop(context));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary),
                        child: Text('기기 연결'),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: pairingDevices.length),
            ),
            Container(
              width: size.width,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.bleScanning);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary),
                child: Text('추가 기기 찾기'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
