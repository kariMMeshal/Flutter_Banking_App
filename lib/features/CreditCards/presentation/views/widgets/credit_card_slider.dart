import 'package:banking_app2/features/CreditCards/data/credit_cards_types.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/custom_credit_card.dart';
import 'package:flutter/material.dart';

class CreditCardSlider extends StatelessWidget {
  const CreditCardSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomCreditCard(
              cardHolderName: "kareem hamdy mohamed",
              cardNumber: "1234567892062131",
              expiryDate: "20/27",
              cardType: EgyptianCreditCardType.AlexBank,
            ),
          );
        },
      ),
    );
  }
}
