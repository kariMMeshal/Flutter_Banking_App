import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'
    hide TextDirection; // Hide TextDirection from intl

class CustomTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController myController;
  final bool isHidden;
  final bool isDatePicker;
  final TextInputType? inputType;

  const CustomTextfield({
    super.key,
    required this.hint,
    required this.myController,
    this.isHidden = false,
    this.isDatePicker = false,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    if (isDatePicker && myController.text.isEmpty) {
      myController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    }

    return TextFormField(
      keyboardType: inputType,
      obscureText: isHidden,
      readOnly: isDatePicker,
      onTap: isDatePicker ? () => _selectDate(context) : null,
      validator: (val) {
        if (val == "") {
          return "Can't be empty";
        }
        if (val!.length < 5) {
          return "too short";
        }
        if (isDatePicker &&
            myController.text ==
                DateFormat('yyyy-MM-dd').format(DateTime.now())) {
          return "Choose a valid Birth Date";
        }
        return null;
      },
      controller: myController,
      style: Styles.ktextStyle16,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: hint,
        hintStyle: Styles.ktextStyle14.copyWith(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: kborder, width: .5),
            gapPadding: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: kborder, width: .5),
            gapPadding: 15),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.red, width: .5),
        ),
        suffixIcon: isDatePicker ? const Icon(Icons.calendar_today) : null,
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2026),
    );
    if (picked != null) {
      myController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }
}
