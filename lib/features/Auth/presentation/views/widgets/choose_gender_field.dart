import 'package:banking_app2/features/Auth/presentation/views/widgets/custom_gender_button.dart';
import 'package:flutter/material.dart';

class ChooseGenderField extends StatefulWidget {
  const ChooseGenderField({
    super.key,
  });

  @override
  State<ChooseGenderField> createState() => _ChooseGenderFieldState();
}

class _ChooseGenderFieldState extends State<ChooseGenderField> {
  bool isMale = false;
  bool isFemale = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomGenderButton(
            onPressed: () => setState(() {
                  isMale = true;
                  isFemale = false;
                }),
            title: "Male",
            iconData: Icons.man,
            isSelected: isMale),
        CustomGenderButton(
            onPressed: () => setState(() {
                  isMale = false;
                  isFemale = true;
                }),
            title: "Female",
            iconData: Icons.woman,
            isSelected: isFemale),
      ],
    );
  }
}


