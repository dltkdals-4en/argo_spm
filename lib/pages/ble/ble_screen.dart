import 'package:argo_spm/constants/constants.dart';
import 'package:argo_spm/providers/ble_provider.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:argo_spm/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BleScreen extends StatefulWidget {
  const BleScreen({Key? key}) : super(key: key);

  @override
  State<BleScreen> createState() => _BleScreenState();
}

class _BleScreenState extends State<BleScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BleProvider>(context, listen: false).scanBle();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ble = Provider.of<BleProvider>(context);
    var size = MediaQuery.of(context).size;
    var prefs = Provider.of<PrefsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('블루투스 스캔하기'),
        actions: [
          IconButton(
            onPressed: () {
              ble.initBleDevices();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: (ble.getBleList == false)
          ? Container(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                  NorH,
                  Text(
                    '기기를 찾는 중입니다.',
                    style: makeTextStyle(18, AppColors.black, 'bold'),
                  ),
                ],
              ),
            )
          : (ble.bleList.length == 0)
              ? Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: size.height,
                        child: Text(
                          '기기를 찾을 수 없습니다.\n기기의 연결 상태를 확인 후, 다시 시도해주세요.',
                          style: makeTextStyle(18, AppColors.black, 'bold'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: ElevatedButton(
                        onPressed: () {
                          ble.initBleDevices();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary),
                        child: Container(
                          width: size.width,
                          height: 60,
                          child: Center(
                              child: Text(
                            '재검색',
                            style: makeTextStyle(20, AppColors.white, 'bold'),
                          )),
                        ),
                      ),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        '총 ${ble.bleList.length}개의 기기를 찾았어요.',
                        style: makeTextStyle(18, AppColors.black, 'bold'),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: ble.bleList.length,
                        itemBuilder: (context, index) {
                          var device = ble.bleList[index].device;
                          return ListTile(
                            title: Text(
                              '${device.name ?? "알 수 없는 기기"}',
                              style: makeTextStyle(16, AppColors.black),
                            ),
                            subtitle:
                                Text((device.isBonded) ? '페어링 O' : '페어링 X'),
                            trailing: ElevatedButton(
                              onPressed: () async {
                                if (device.isBonded) {
                                  await ble
                                      .connectBle(context, size, device, prefs)
                                      .then((value) => Navigator.of(context)
                                          .pushNamed(Routes.home));
                                } else {
                                  await ble.devicePairing(device.address);
                                }
                              },
                              child: Text('연결하기'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary),
                            ),
                            onTap: () {},
                            // bleProvider.setSelectedDivice(device);
                            // bleProvider.selectedIndex = index;
                            // if (!device.isBonded) {
                            //   await bleProvider
                            //       .devicePairing(device.address)
                            //       .then((value) {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => GetPairingDevices(),
                            //       ),
                            //     );
                            //   });
                            // } else {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => DeviceConnectPage(),
                            //     ),
                            //   );
                            // }
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                      ),
                    ),
                  ],
                ),
    );
  }
}
