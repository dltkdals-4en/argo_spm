import 'package:flutter/material.dart';

class PhotosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 15,
        ),
        padding: EdgeInsets.symmetric(horizontal: 22),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/photo_${index + 1}.jpg',
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
