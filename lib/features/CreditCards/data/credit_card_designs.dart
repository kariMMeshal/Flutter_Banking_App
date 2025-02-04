import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:banking_app2/features/CreditCards/data/credit_cards_types.dart';

class CreditCardDesigns { 

  CreditCardDesigns({
    required this.gradientColors,
    required this.displayText,
    required this.textStyle,
    required this.icon,
  });
  final List<Color> gradientColors;
  final String displayText; 
  final TextStyle textStyle; 
  final IconData icon;
}

// Map each bank type to its design
final Map<EgyptianCreditCardType, CreditCardDesigns> creditCardDesigns = {
  EgyptianCreditCardType.Visa: CreditCardDesigns(
    gradientColors: [Colors.blue, Colors.indigo],
    displayText: 'Visa',
    textStyle: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    icon: Icons.credit_card,
  ),
  EgyptianCreditCardType.Alahli: CreditCardDesigns(
    gradientColors:[Colors.green, Colors.lightGreen],
    displayText: 'Al Ahli',
    textStyle: GoogleFonts.lato(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    icon: Icons.account_balance,
  ),
  EgyptianCreditCardType.Meeza: CreditCardDesigns(
    gradientColors: [Colors.purple, Colors.deepPurple],
    displayText: 'Meeza',
    textStyle: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    icon: Icons.credit_score,
  ),
  EgyptianCreditCardType.MasterCard: CreditCardDesigns(
    gradientColors: [Colors.orange, Colors.red],
    displayText: 'MasterCard',
    textStyle: GoogleFonts.robotoCondensed(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    icon: Icons.credit_card,
  ),
  EgyptianCreditCardType.AmericanExpress: CreditCardDesigns(
    gradientColors: [Colors.blue, Colors.green],
    displayText: 'Amex',
    textStyle: GoogleFonts.openSans(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    icon: Icons.credit_card,
  ),
  EgyptianCreditCardType.NBE: CreditCardDesigns(
    gradientColors:  [Colors.red, Colors.deepOrange],
    displayText: 'NBE',
    textStyle: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    icon: Icons.account_balance_wallet,
  ),
  EgyptianCreditCardType.BanqueMisr: CreditCardDesigns(
    gradientColors: [Colors.blue, Colors.cyan],
    displayText: 'Banque Misr',
    textStyle: GoogleFonts.raleway(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    icon: Icons.business,
  ),
  EgyptianCreditCardType.CIB: CreditCardDesigns(
    gradientColors: [Colors.deepOrange,Colors.yellowAccent],
    displayText: 'CIB',
    textStyle: GoogleFonts.ubuntu(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    icon: Icons.account_balance,
  ),
  EgyptianCreditCardType.AlexBank: CreditCardDesigns(
    gradientColors: [Colors.orange, Colors.deepOrange],
    displayText: 'Alex Bank',
    textStyle: GoogleFonts.merriweather(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    icon: Icons.business,
  ),
  EgyptianCreditCardType.HSBC: CreditCardDesigns(
    gradientColors: [Colors.red, Colors.white],
    displayText: 'HSBC',
    textStyle: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    icon: Icons.account_balance,
  ),
  EgyptianCreditCardType.Fawry: CreditCardDesigns(
    gradientColors: [Colors.green, Colors.yellow],
    displayText: 'Fawry',
    textStyle: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    icon: Icons.payment,
  ),
};