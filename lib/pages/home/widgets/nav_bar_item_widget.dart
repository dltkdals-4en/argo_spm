import 'package:flutter/material.dart';

class NavBarItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String image;

  const NavBarItemWidget({
    Key? key,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        child: Image.asset(
          'assets/images/$image.png',
        ),
      ),
    );
  }
}
