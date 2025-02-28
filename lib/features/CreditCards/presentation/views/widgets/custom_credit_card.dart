import 'package:banking_app2/core/Helpers/local_auth_helper.dart';
import 'package:banking_app2/core/common/widgets/alert_dialog.dart';
import 'package:banking_app2/features/CreditCards/data/credit_card_designs.dart';
import 'package:banking_app2/features/CreditCards/data/credit_cards_types.dart';
import 'package:banking_app2/features/CreditCards/presentation/manager/CreditCards-bloc/creditcards_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({
    super.key,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardTypeString,
    required this.first12,
    required this.last4,
    required this.cardId,
  });

  final String cardId, cardHolderName, first12, last4, expiryDate;
  final String cardTypeString;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  bool isEncryptedVisible = false;

  EgyptianCreditCardType cardTypeFromString(String cardTypeString) =>
      EgyptianCreditCardType.values.firstWhere(
        (e) => e.toString().split('.').last == cardTypeString,
        orElse: () => EgyptianCreditCardType.Visa,
      );

  @override
  Widget build(BuildContext context) {
    final cardType = cardTypeFromString(widget.cardTypeString);
    final design = creditCardDesigns[cardType] ??
        CreditCardDesigns(
          gradientColors: [Colors.grey, Colors.black],
          displayText: 'Default',
          textStyle: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          icon: Icons.credit_card,
        );

    return BlocBuilder<CreditcardsBloc, CreditcardsState>(
      builder: (context, state) {
        String cardNumber = isEncryptedVisible
            ? "${widget.first12}${widget.last4}"
            : "************${widget.last4}";

        if (state is EncryptedCardDataLoadedState &&
            state.encryptedData.isNotEmpty) {
          cardNumber = state.encryptedData['encryptedFirst12']!;
        }
        final LocalAuthHelper authHelper = LocalAuthHelper();
        return GestureDetector(
          onTap: () async {
            if (!isEncryptedVisible) {
              // ignore: use_build_context_synchronously
              context.read<CreditcardsBloc>().add(
                    LoadEncryptedCardDataEvent(cardId: widget.cardId),
                  );
            }
            setState(() => isEncryptedVisible = !isEncryptedVisible);
          },
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
                  .add(DeleteCardEvent(cardId: widget.cardId));
            }
          },
          child: Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: design.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(design),
                  const SizedBox(height: 16),
                  _buildCardNumber(cardNumber),
                  const SizedBox(height: 24),
                  _buildFooter(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(CreditCardDesigns design) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(design.displayText, style: design.textStyle),
          Icon(design.icon, color: Colors.white, size: 28),
        ],
      );

  Widget _buildCardNumber(String cardNumber) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (widget, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
              child: widget,
            ),
          );
        },
        child: Text(
          cardNumber.replaceAllMapped(
              RegExp(r'.{4}'), (match) => '${match.group(0)} '),
          key: ValueKey<String>(cardNumber),
          style: GoogleFonts.robotoMono(
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 1.5,
          ),
        ),
      );

  Widget _buildFooter() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFooterColumn(
              'Card Holder', widget.cardHolderName.toUpperCase()),
          _buildFooterColumn('Expiry', widget.expiryDate),
        ],
      );

  Widget _buildFooterColumn(String label, String value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  GoogleFonts.montserrat(color: Colors.white70, fontSize: 12)),
          Text(value,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )),
        ],
      );
}
