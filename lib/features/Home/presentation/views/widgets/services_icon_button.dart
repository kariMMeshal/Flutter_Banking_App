import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:flutter/material.dart';

class ServicesIconButton extends StatelessWidget {

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
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback ontap;
  final String? bottomText;

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: .01)),
      height: height ?? 90,
      width: width ?? 90,
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: iconColor ?? Colors.indigoAccent,
              size: 35,
            ),
            Text(
              bottomText!,
              style: Styles.ktextStyle10,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
