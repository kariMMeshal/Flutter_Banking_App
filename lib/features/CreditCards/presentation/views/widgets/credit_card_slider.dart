import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/features/CreditCards/presentation/manager/CreditCards-bloc/creditcards_bloc.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/custom_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditCardSlider extends StatelessWidget {
  const CreditCardSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditcardsBloc, CreditcardsState>(
      builder: (context, state) {
        if (state is CreditcardsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CreditCardsLoadedState) {
          final cards = state.cards;
          if (cards.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                  child: Text(
                "No cards available :)",
                style:
                    Styles.ktextStyle12.copyWith(color: Colors.grey.shade500),
              )),
            );
          }
          return SizedBox(
            height: 200,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              itemBuilder: (context, index) {
                var card = cards[index];
                String first12 = card.encryptedFirst12.isEmpty
                    ? "************"
                    : card.encryptedFirst12;

                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomCreditCard(
                      cardHolderName: card.cardholderName,
                      first12: first12,
                      last4: card.last4,
                      expiryDate: card.expiryDate,
                      cardTypeString: card.cardType,
                      cardId: card.id,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is ErrorState) {
          return Center(child: Text("Error: ${state.errorMessage.toString()}"));
        } else {
          return const Center(child: Text("No cards available"));
        }
      },
    );
  }
}
