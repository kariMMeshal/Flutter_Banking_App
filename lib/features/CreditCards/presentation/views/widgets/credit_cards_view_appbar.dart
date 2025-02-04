import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/common/widgets/custom_appbar_iconbutton.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/add_cards_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreditCardsViewAppbar extends StatelessWidget {
  const CreditCardsViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppbarIconButton(
            ontap: () {},
            icondata: Icons.arrow_back_ios,
            padding: const EdgeInsets.only(left: 5),
          ),
          const Text('My Cards', style: Styles.ktextStyle20),
          CustomAppbarIconButton(
            ontap: () {
              GoRouter.of(context).push(AddCardView.route);
            },
            icondata: Icons.add_card_rounded,
          ),
        ],
      ),
    );
  }
}
