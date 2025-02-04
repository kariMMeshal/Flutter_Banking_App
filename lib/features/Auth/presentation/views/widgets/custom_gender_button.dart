import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomGenderButton extends StatelessWidget {
  const CustomGenderButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.iconData,
    this.isSelected = false,
  });
  final void Function()? onPressed;
  final String title;
  final bool isSelected;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50,
      minWidth: 120,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: isSelected ? kPurple : Colors.grey,
            width: isSelected ? 1 : .3,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: isSelected ? kPurple : null),
          Text(
            title,
            style: Styles.ktextStyle16
                .copyWith(color: isSelected ? kPurple : null),
          ),
        ],
      ),
    );
  }
}
