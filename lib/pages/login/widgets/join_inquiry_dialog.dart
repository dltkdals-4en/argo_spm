import 'package:flutter/cupertino.dart';

import '../../../constants/constants.dart';

class JoinInquiryDialog extends StatelessWidget {
  const JoinInquiryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Center(child: Text('AgroDoctorSPM 고객 전용')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('-본 페이지는 AgroDoctorSPM 고객 전용입니다.'),
                  SmH,
                  Text('-AgroDoctorSPM 고객인데 아이디/비밀번호를 모르시는 경우, 담당자에게 문의해주세요.'),
                  SmH,
                  Text('-AgroDoctorSPM 고객이 아니시라면, 상담 문의를 신청해주세요.'),
                  NorH,
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteGrey,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('상담 문의', style: makeTextStyle(16, null, 'bold')),
                  SmH,
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '070-0000-0000',
                          style: makeTextStyle(12, null, 'regular'),
                        ),
                        Text(
                          'admin@4en.co.kr',
                          style: makeTextStyle(12, null, 'regular'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
