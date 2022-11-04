import 'package:flutter/material.dart';

class ScoreText extends StatelessWidget {
  final int score;
  final double? textSize;
  final double? iconSize;
  const ScoreText({
    Key? key,
    required this.score,
    this.textSize,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).textTheme.headline6?.color;

    if (score < 20) {
      color = Colors.white;
    } else if (score < 80) {
      color = Colors.deepOrange;
    } else {
      color = Colors.green;
    }

    return Row(
      children: <Widget>[
        Image.asset(
          'assets/images/icon_score.png',
          width: 15,
          height: 15,
        ),
        SizedBox(
          width: 3.5,
        ),
        Text(
          ' ' + score.toString(),
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontSize: textSize ?? 15,
                fontWeight: FontWeight.w700,
                color: color,
              ),
        ),
      ],
    );
  }
}
