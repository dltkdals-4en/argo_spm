class Notice {
  String title;
  String text;
  String date;
  Notice({
    required this.title,
    required this.text,
    required this.date,
  });
}

final notices = [
  Notice(
    title: '분석 데이터 업데이트 알림',
    text: '분석 주요 지표 데이터가 업데이트 되었습니다. 최신 데이터로 업데이트하세요',
    date: '5:30 am',
  ),
  Notice(
    title: 'AgroDoctor 서비스 시작',
    text: '토양 분석 전문 어플리케이션 AgroDoctor의 서비스가 시작되었습니다',
    date: 'Yesterday',
  ),
];
