import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  const CustomIconButton({
    super.key,
    required this.iconData,
    this.height,
    this.width,
    this.backgroundColor,
    this.iconColor,
    required this.ontap, this.iconSize,
  });
  final double? height;
  final double? width;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback ontap;

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? kPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: height ?? 60,
        width: width ?? 60,
        child: Icon(iconData, color: iconColor ?? Colors.white , size: iconSize,),
      ),
    );
  }
}
