import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/credit_card_slider.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/transaction_list_view.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/credit_cards_view_appbar.dart';
import 'package:flutter/material.dart';

class CreditCardsViewBody extends StatelessWidget {
  const CreditCardsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CreditCardsViewAppbar(),
        CreditCardSlider(),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text("Recent", style: Styles.ktextStyle20),
        ),
        TransactionListView(),
      ],
    );
  }
}
