import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/common/widgets/alert_dialog.dart';
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
        }
        if (state is ErrorState) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        }
        if (state is! CreditCardsLoadedState || state.cards.isEmpty) {
          return Center(
            child: Text("No cards available :)",
                style:
                    Styles.ktextStyle12.copyWith(color: Colors.grey.shade500)),
          );
        }

        return SizedBox(
          height: 200,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.cards.length,
            itemBuilder: (context, index) {
              final card = state.cards[index];

              return InkWell(
                onLongPress: () async {
                  bool? confirmed = await showConfirmationDialog(
                    context,
                    title: "Confirm Action",
                    content: "Are you sure you want to delete this card?",
                  );
                  if (confirmed == true) {
                    // ignore: use_build_context_synchronously
                    context
                        .read<CreditcardsBloc>()
                        .add(DeleteCardEvent(cardId: card.id));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomCreditCard(
                    cardHolderName: card.cardholderName,
                    cardNumber: "************${card.cardNumber}",
                    expiryDate: card.expiryDate,
                    cardTypeString: card.cardType,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
