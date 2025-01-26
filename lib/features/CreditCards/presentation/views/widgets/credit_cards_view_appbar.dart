import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:flutter/material.dart';

class CreditCardsViewAppbar extends StatelessWidget {
  const CreditCardsViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("My Cards", style: Styles.ktextStyle24),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_card_rounded, size: 34),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
