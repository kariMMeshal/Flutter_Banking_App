import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.contentPadding,
  });
  final void Function() onPressed;
  final String title;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        padding: contentPadding,
        alignment: Alignment.center,
        height: height ?? 60,
        width: width ?? MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: backgroundColor ?? kPurple,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kborder, width: .3),
        ),
        child: Text(
          title,
          style: Styles.ktextStyle18.copyWith(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
