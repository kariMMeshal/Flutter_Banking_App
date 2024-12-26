import 'package:banking_app2/core/styles.dart';
import 'package:flutter/material.dart';

class BuildPage extends StatelessWidget {
  const BuildPage({
    super.key,
    required this.title,
    this.subTitle,
    required this.imgUrl,
  });

  final String title;
  final String? subTitle;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * .47,
            child: Image.asset(imgUrl)),
        Text(title, style: Styles.ktextStyle28),
        Text(
          subTitle ?? "",
          style: Styles.ktextStyle16
              .copyWith(color: Colors.black.withValues(alpha: 0.5)),
        )
      ],
    );
  }
}
