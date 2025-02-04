import 'package:banking_app2/features/CreditCards/presentation/views/widgets/credit_cards_view_body.dart';
import 'package:flutter/material.dart';

class CreditCardsView extends StatelessWidget {
  const CreditCardsView({super.key});
  static const String route = '/walletView';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: CreditCardsViewBody(),
    ));
  }
}
