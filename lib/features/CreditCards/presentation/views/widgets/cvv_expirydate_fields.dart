import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/validator.dart';
import 'package:flutter/material.dart';

class CVVExpiryDateFields extends StatelessWidget {
  const CVVExpiryDateFields({
    super.key,
    required this.cvvController,
    required this.expiryDateController,
  });

  final TextEditingController cvvController;
  final TextEditingController expiryDateController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('CVV', style: Styles.ktextStyle12),
              TextFormField(
                controller: cvvController,
                decoration: InputDecoration(
                  hintText: 'CVV',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                keyboardType: TextInputType.number,
                maxLength: 3,
                validator: (value) => Validator.validateCVV(value),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Expiry Date', style: Styles.ktextStyle12),
              TextFormField(
                controller: expiryDateController,
                decoration: InputDecoration(
                  hintText: 'MM/YY',
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                keyboardType: TextInputType.number,
                maxLength: 5,
                onChanged: (value) {
                  if (value.length == 2 && !value.contains('/')) {
                    expiryDateController.text = '$value/';
                    expiryDateController.selection = TextSelection.fromPosition(
                      TextPosition(offset: expiryDateController.text.length),
                    );
                  }
                },
                validator: (value) => Validator.validateExpiryDate(value),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
