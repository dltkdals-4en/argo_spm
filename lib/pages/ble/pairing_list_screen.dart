import 'package:argo_spm/providers/ble_provider.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:argo_spm/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../constants/screen_size.dart';

class ParingListScreen extends StatelessWidget {
  const ParingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ble = Provider.of<BleProvider>(context);
    var size = MediaQuery.of(context).size;
    ble.getPairingList();
    var pairingDevices = ble.pairingList;
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
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              child: Padding(
                padding: EdgeInsets.all(NORMALGAP),
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
                padding: EdgeInsets.all(NORMALGAP),
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
                                context,
                                size,
                                pairingDevices[index],
                              )
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
