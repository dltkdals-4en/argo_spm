import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


import '../../model/notice.dart';
import 'widgets/notice_list_item_widget.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notifications'.tr()),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 15, bottom: 25),
        itemCount: notices.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return NotificationsListItemWidget(
            notification: notices[index],
          );
        },
      ),
    );
  }
}
