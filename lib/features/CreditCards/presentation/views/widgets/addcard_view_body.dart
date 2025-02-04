import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/common/widgets/custom_button.dart';
import 'package:banking_app2/core/common/widgets/custom_textfield.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/core/utils/validator.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/card_type_dropdown.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/cvv_expirydate_fields.dart';
import 'package:flutter/material.dart';
import 'package:banking_app2/features/CreditCards/data/credit_cards_types.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AddcardViewBody extends StatelessWidget {
  AddcardViewBody({super.key});

  final formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  final cardholderNameController = TextEditingController();
  final cvvController = TextEditingController();
  final expiryDateController = TextEditingController();

  EgyptianCreditCardType? selectedCardType;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 150,
              child: Image.asset('assets/images/addcard.png'),
            ),
            const Text('Card Type', style: Styles.ktextStyle12),
            CardTypeDropdown(
              onCardTypeSelected: (EgyptianCreditCardType? cardType) {
                selectedCardType = cardType;
              },
            ),
            const SizedBox(height: 15),
            const Text('Card Number', style: Styles.ktextStyle12),
            CustomTextfield(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              maxLength: 16,
              hint: "Card number",
              myController: cardNumberController,
              prefexicon: const Icon(Icons.credit_card),
              inputType: TextInputType.number,
              validator: (value) => Validator.validateCardNumber(value),
            ),
            const Text("Card Holder Name", style: Styles.ktextStyle12),
            CustomTextfield(
              hint: "Card Holder name",
              myController: cardholderNameController,
              prefexicon: const Icon(Icons.person),
              validator: (value) => Validator.validateCardHolderName(value),
            ),
            const SizedBox(height: 15),
            CVVExpiryDateFields(
                cvvController: cvvController,
                expiryDateController: expiryDateController),
            const SizedBox(height: 10),
            CustomButton(
              title: 'Submit',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Card details submitted successfully!")),
                  );
                }
              },
              backgroundColor: kBlue,
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}
