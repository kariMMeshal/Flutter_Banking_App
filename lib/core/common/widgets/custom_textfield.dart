import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection; // Hide TextDirection from intl

class CustomTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController myController;
  final bool isHidden;
  final bool isDatePicker;
  final TextInputType? inputType;
  final String? Function(String?)? validator; // Updated validator type

  const CustomTextfield({
    super.key,
    required this.hint,
    required this.myController,
    this.isHidden = false,
    this.isDatePicker = false,
    this.inputType,
    this.validator, // Made validator optional
  });

  @override
  Widget build(BuildContext context) {
    // Set initial date for date picker if the field is empty
    if (isDatePicker && myController.text.isEmpty) {
      myController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    }

    return TextFormField(
      keyboardType: inputType,
      obscureText: isHidden,
      readOnly: isDatePicker,
      onTap: isDatePicker ? () => _selectDate(context) : null,
      validator: validator, // Pass the validator directly
      controller: myController,
      style: Styles.ktextStyle16,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: hint,
        hintStyle: Styles.ktextStyle14.copyWith(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: kborder, width: 0.5),
          gapPadding: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: kborder, width: 0.5),
          gapPadding: 15,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.red, width: 0.5),
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