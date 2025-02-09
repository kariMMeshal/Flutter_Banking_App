import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomProfileListtile extends StatelessWidget {
  const CustomProfileListtile(
      {super.key,
      required this.ontap,
      required this.iconData,
      required this.title});
  final Function ontap;
  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: ListTile(
        onTap: () {
          ontap();
        },
        trailing: const Icon(Icons.arrow_forward_ios),
        leading: Container(
          width: 70,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(50)),
          child: Icon(iconData, color: Colors.white),
        ),
        title: Text(title, style: Styles.ktextStyle20),
      ),
    );
  }
}
