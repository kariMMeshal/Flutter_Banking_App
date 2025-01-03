import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/services_icon_button.dart';
import 'package:flutter/material.dart';

class HomeServicesSection extends StatelessWidget {
  const HomeServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kborder, width: .01)),
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      child: Column(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ServicesIconButton(
                  iconData: Icons.arrow_upward_rounded,
                  ontap: () {},
                  bottomText: "Pay"),
              ServicesIconButton(
                  iconData: Icons.arrow_downward_rounded,
                  ontap: () {},
                  bottomText: "Recieve"),
              ServicesIconButton(
                  iconData: Icons.receipt_long_rounded,
                  ontap: () {},
                  bottomText: "pills"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ServicesIconButton(
                  iconData: Icons.compare_arrows_rounded,
                  ontap: () {},
                  bottomText: "Transactions"),
              ServicesIconButton(
                  iconData: Icons.credit_card,
                  ontap: () {},
                  bottomText: "Credit card"),
              ServicesIconButton(
                  iconData: Icons.attach_money_rounded,
                  ontap: () {},
                  bottomText: "History"),
            ],
          ),
        ],
      ),
    );
  }
}
