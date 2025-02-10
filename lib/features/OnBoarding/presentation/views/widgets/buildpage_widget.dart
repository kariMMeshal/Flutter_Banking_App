import 'package:banking_app2/core/common/styles/styles.dart';
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
            height: MediaQuery.of(context).size.height * .40,
            child: Image.asset(imgUrl)),
        Text(title, style: Styles.ktextStyle24, textAlign: TextAlign.center),
        Text(
          subTitle ?? '',
          textAlign: TextAlign.center,
          style: Styles.ktextStyle14.copyWith(
            color: Colors.black.withValues(alpha: 0.5),
          ),
        )
      ],
    );
  }
}
