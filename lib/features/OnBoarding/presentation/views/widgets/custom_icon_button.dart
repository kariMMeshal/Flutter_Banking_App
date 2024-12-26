import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? iconColor;
  final Function? ontap;

  const CustomIconButton({
    super.key,
    required this.iconData,
    this.height,
    this.width,
    this.backgroundColor,
    this.iconColor,
    this.ontap,
  });

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? kPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 20),
      height: height ?? 60,
      width: width ?? 60,
      child: Icon(iconData, color: iconColor ?? Colors.white),
    );
  }
}
