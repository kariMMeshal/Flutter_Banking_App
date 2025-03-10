import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/add_manual_payment.dart';
import 'package:banking_app2/features/Home/presentation/manager/BottomNav_Cubit/bottom_nav_cubit.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/reciept_text_extract.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/services_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

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
                    GoRouter.of(context).push(ReceiptTextExtractor.route);
                  },
                  bottomText: 'Import receipt'),
              ServicesIconButton(
                  iconData: Icons.add_box,
                  ontap: () {
                    GoRouter.of(context).push(AddManualPayment.route);
                  },
                  bottomText: 'Add Payment'),
              ServicesIconButton(
                  iconData: FontAwesomeIcons.creditCard,
                  ontap: () {
                    BlocProvider.of<BottomNavCubit>(context).setIndex(2);
                  },
                  bottomText: 'Credit Cards'),
              ServicesIconButton(
                  iconData: FontAwesomeIcons.chartColumn,
                  ontap: () {
                    BlocProvider.of<BottomNavCubit>(context).setIndex(3);
                  },
                  bottomText: 'History'),
            ],
          ),
        ],
      ),
    );
  }
}
