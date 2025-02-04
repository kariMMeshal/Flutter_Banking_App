import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/addcard_view_body.dart';
import 'package:flutter/material.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});
  static String route = '/addCardsView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AddcardViewBody(),
        appBar: AppBar(
          title: const Text('Add a new card', style: Styles.ktextStyle20),
        ),
      ),
    );
  }
}
