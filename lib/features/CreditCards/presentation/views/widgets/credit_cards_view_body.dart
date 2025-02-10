import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/credit_card_slider.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/spinding_limit_slider.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/transaction_list_view.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/credit_cards_view_appbar.dart';
import 'package:banking_app2/features/Home/presentation/manager/Wallet_Cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditCardsViewBody extends StatelessWidget {
  const CreditCardsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    double maxValue =
        BlocProvider.of<WalletCubit>(context).totalSalary.toDouble();
    double spendingLimit =
        BlocProvider.of<WalletCubit>(context).monthlyLimit.toDouble();
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const CreditCardsViewAppbar(),
        const CreditCardSlider(),
        const SizedBox(height: 10),
        const TransactionListView(itemsNum: 3),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text("Monthly Spending Limit", style: Styles.ktextStyle18),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SpendingLimitSlider(
            minValue: 0,
            maxValue: maxValue,
            spendingLimit: spendingLimit,
          ),
        ),
      ],
    );
  }
}
