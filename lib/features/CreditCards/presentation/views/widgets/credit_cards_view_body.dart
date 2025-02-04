import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
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
        const CreditCardsViewAppbar(),
        const CreditCardSlider(),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Transactions', style: Styles.ktextStyle18),
              InkWell(
                  onTap: () {},
                  child: Text('Show all',
                      style: Styles.ktextStyle12.copyWith(color: kBlue))),
            ],
          ),
        ),
        const TransactionListView(),
      ],
    );
  }
}
