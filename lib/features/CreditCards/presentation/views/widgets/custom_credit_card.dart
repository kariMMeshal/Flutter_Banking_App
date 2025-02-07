import 'package:banking_app2/features/CreditCards/data/credit_card_designs.dart';
import 'package:banking_app2/features/CreditCards/data/credit_cards_types.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({
    super.key,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardTypeString,
  });
  final String cardHolderName, cardNumber, expiryDate;
  final String cardTypeString;
  EgyptianCreditCardType cardTypeFromString(String cardTypeString) {
    return EgyptianCreditCardType.values.firstWhere(
      (e) => e.toString().split('.').last == cardTypeString,
      orElse: () => EgyptianCreditCardType.Visa,
    );
  }

  @override
  Widget build(BuildContext context) {
    EgyptianCreditCardType cardType = cardTypeFromString(cardTypeString);
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

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
            _buildCardNumber(),
            const SizedBox(height: 24),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(CreditCardDesigns design) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          design.displayText,
          style: design.textStyle,
        ),
        Icon(design.icon, color: Colors.white, size: 28),
      ],
    );
  }

  Widget _buildCardNumber() {
    return Text(
      cardNumber.replaceAllMapped(
          RegExp(r'.{4}'), (match) => '${match.group(0)} '),
      style: GoogleFonts.robotoMono(
        color: Colors.white,
        fontSize: 20,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFooterColumn('Card Holder', cardHolderName.toUpperCase()),
        _buildFooterColumn('Expiry', expiryDate),
      ],
    );
  }

  Widget _buildFooterColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 12),
        ),
        Text(
          value,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
