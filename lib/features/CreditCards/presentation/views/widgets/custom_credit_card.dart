import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/CreditCards/data/credit_cards_types.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCreditCard extends StatelessWidget {
  final String cardHolderName, cardNumber, expiryDate;
  final EgyptianCreditCardType cardType;

  const CustomCreditCard({
    super.key,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: kShadedBlue,
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
            _buildHeader(),
            const SizedBox(height: 16),
            _buildCardNumber(),
            const SizedBox(height: 16),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cardType.toString().split('.').last,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(Icons.credit_card, color: Colors.white, size: 28),
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
        letterSpacing: 2.0,
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
