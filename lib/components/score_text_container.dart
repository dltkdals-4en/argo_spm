import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'score_text.dart';

class RatingTextContainer extends StatelessWidget {
  final double rating;

  const RatingTextContainer({Key? key, required this.rating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 7.5,
      ),
      decoration: BoxDecoration(
        color: rating < 20 ? AppColors.oriRed : Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: ScoreText(
        score: 0,
      ),
    );
  }
}
