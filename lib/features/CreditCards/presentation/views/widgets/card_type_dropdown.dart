import 'package:banking_app2/features/CreditCards/data/credit_cards_types.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// **Stateful Widget for Dropdown**
class CardTypeDropdown extends StatefulWidget {
  const CardTypeDropdown({super.key, required this.onCardTypeSelected});
  final Function(String?) onCardTypeSelected;

  @override
  CardTypeDropdownState createState() => CardTypeDropdownState();
}

class CardTypeDropdownState extends State<CardTypeDropdown> {
  String? selectedCardType;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        icon: const Icon(FontAwesomeIcons.ccVisa),
      ),
      items: EgyptianCreditCardType.values
          .map((cardType) => DropdownMenuItem<String>(
                value: cardType.name,
                child: Text(cardType.name),
              ))
          .toList(),
      onChanged: (newValue) {
        setState(() {
          selectedCardType = newValue;
        });
        widget.onCardTypeSelected(newValue);
      },

      /// **Added Validator**
      validator: (value) {
        if (value == null) {
          return "Please select a card type";
        }
        return null;
      },
    );
  }
}
