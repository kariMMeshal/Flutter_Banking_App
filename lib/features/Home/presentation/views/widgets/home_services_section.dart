import 'package:banking_app2/core/utils/constants.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ServicesIconButton(
                  iconData: FontAwesomeIcons.wallet,
                  iconColor: Colors.indigo,
                  ontap: () {},
                  bottomText: 'ًWallet'),
              ServicesIconButton(
                  iconData: FontAwesomeIcons.moneyBillTransfer,
                  iconColor: Colors.green,
                  ontap: () {},
                  bottomText: 'Transfer'),
              ServicesIconButton(
                  iconData:FontAwesomeIcons.handHoldingDollar,
                  iconColor: const Color(0xffE1169A),
                  ontap: () {},
                  bottomText: 'withdraw'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ServicesIconButton(
                  iconData: FontAwesomeIcons.solidCreditCard,
                  iconColor: const Color(0xffFB6B18),
                  ontap: () {},
                  bottomText: 'Credit\nCard'),
                ServicesIconButton(
                  iconData:FontAwesomeIcons.receipt,
                  iconColor: const Color(0xff52D5BA),
                  ontap: () {},
                  bottomText: 'pills'),
              ServicesIconButton(
                  iconData:FontAwesomeIcons.moneyBillTrendUp,
                  iconColor: const Color(0xffFFAF2A),
                  ontap: () {},
                  bottomText: 'Deposit'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                ServicesIconButton(
                  iconData: Icons.receipt_long,
                  iconColor: Colors.deepPurple,
                  ontap: () {},
                  bottomText: 'Transactions\nreport'),
              ServicesIconButton(
                  iconData: FontAwesomeIcons.handHoldingHeart,
                  iconColor: const Color(0xffFF4267),
                  ontap: () {},
                  bottomText: 'Donations'),
              ServicesIconButton(
                  iconData: FontAwesomeIcons.vault,
                  iconColor: const Color(0xff5655B9),
                  ontap: () {},
                  bottomText: 'Savings'),
            ],
          ),
        ],
      ),
    );
  }
}
