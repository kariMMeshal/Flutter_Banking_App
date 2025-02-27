import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/reciept_text_extract.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/services_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeServicesSection extends StatelessWidget {
  const HomeServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kborder, width: .01)),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(15),
      child: Column(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ServicesIconButton(
                  iconData: Icons.receipt_long,
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReceiptTextExtractor(),
                      ),
                    );
                  },
                  bottomText: 'Add receipt'),
              ServicesIconButton(
                  iconData: Icons.add_box,
                  ontap: () {},
                  bottomText: 'Add manual'),
              ServicesIconButton(
                  iconData: FontAwesomeIcons.creditCard,
                  ontap: () {},
                  bottomText: 'Credit Cards'),
              ServicesIconButton(
                  iconData: FontAwesomeIcons.chartColumn,
                  ontap: () {},
                  bottomText: 'History'),
            ],
          ),
        ],
      ),
    );
  }
}
