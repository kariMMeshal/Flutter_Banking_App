import 'package:banking_app2/features/Auth/presentation/views/widgets/custom_gender_button.dart';
import 'package:flutter/material.dart';

class ChooseGenderField extends StatefulWidget {
  final Function(bool isValid) onValidated;

  const ChooseGenderField({
    super.key,
    required this.onValidated,
  });

  @override
  State<ChooseGenderField> createState() => _ChooseGenderFieldState();
}

class _ChooseGenderFieldState extends State<ChooseGenderField> {
  bool choosedGender = false;
  bool isMale = false;
  bool isFemale = false;

  void _updateGenderSelection(bool male, bool female) {
    setState(() {
      choosedGender = true;
      isMale = male;
      isFemale = female;
    });
    widget.onValidated(true); // Notify parent about the valid selection
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomGenderButton(
          onPressed: () => _updateGenderSelection(true, false),
          title: "Male",
          iconData: Icons.man,
          isSelected: isMale,
        ),
        CustomGenderButton(
          onPressed: () => _updateGenderSelection(false, true),
          title: "Female",
          iconData: Icons.woman,
          isSelected: isFemale,
        ),
      ],
    );
  }
}
