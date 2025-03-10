import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/common/widgets/custom_button.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/core/common/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class RegisterBottomSheet extends StatefulWidget {
  const RegisterBottomSheet(
      {super.key, required this.onRegistertap, required this.onbacktap});
  final Function onRegistertap;
  final Function onbacktap;
  @override
  State<RegisterBottomSheet> createState() => _RegisterBottomSheetState();
}

class _RegisterBottomSheetState extends State<RegisterBottomSheet> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
                value: ischecked,
                onChanged: (value) => setState(() {
                      ischecked = !ischecked;
                    })),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Please agree to the ',
                  style: Styles.ktextStyle14.copyWith(color: Colors.black)),
              TextSpan(
                  text: 'Terms&Conditions ',
                  style: Styles.ktextStyle14
                      .copyWith(color: kPurple, fontWeight: FontWeight.bold)),
            ]))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconButton(
              ontap: () => widget.onbacktap(),
              iconData: Icons.arrow_back,
              backgroundColor: const Color(0xffebd7f8),
              iconColor: kPurple,
            ),
            CustomButton(
              onPressed: () => widget.onRegistertap(),
              title: 'Register',
              backgroundColor: const Color(0xff6d05be),
              width: MediaQuery.of(context).size.width * .75,
            ),
          ],
        )
      ],
    );
  }
}
