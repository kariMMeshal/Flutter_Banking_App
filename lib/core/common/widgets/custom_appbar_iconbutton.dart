import 'package:flutter/material.dart';

class CustomAppbarIconButton extends StatelessWidget {
  const CustomAppbarIconButton({
    super.key,
    required this.icondata,
    this.padding = const EdgeInsets.all(0), required this.ontap,
  });
  final IconData icondata;
  final EdgeInsetsGeometry? padding;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: padding,
        alignment: Alignment.center,
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.grey.shade300,
        ),
        child: Center(
          // Wrap the Icon in a Center widget
          child: Icon(
            icondata,
            size: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
