import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ServicesIconButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback ontap;
  final String? bottomText;

  const ServicesIconButton({
    super.key,
    required this.iconData,
    this.height,
    this.width,
    this.backgroundColor,
    this.iconColor,
    required this.ontap,
    this.bottomText = '',
  });

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? kPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            height: height ?? 60,
            width: width ?? 60,
            child: Icon(
              iconData,
              color: iconColor ?? Colors.white,
              size: 30,
            ),
          ),
        ),
        Text(bottomText!, style: Styles.ktextStyle10)
      ],
    );
  }
}
