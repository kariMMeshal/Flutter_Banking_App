import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/common/widgets/custom_loading_indecator.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/transaction_list_view.dart';
import 'package:banking_app2/features/Home/presentation/manager/Wallet_Cubit/wallet_cubit.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/home_custom_appbar.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/home_services_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state is WalletLoading) {
          return const CustomLoadingIndicator();
        } else if (state is WalletError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is WalletUpdated) {
          final currentBalance = state.remainingAmount;

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              HomeCustomAppbar(currentBalance: currentBalance),
              const HomeServicesSection(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Manual Transactions',
                        style: Styles.ktextStyle18),
                    InkWell(
                        onTap: () {},
                        child: Text('Show all',
                            style: Styles.ktextStyle12
                                .copyWith(color: kLightBlue))),
                  ],
                ),
              ),
              const TransactionListView(
                itemsNum: 5,
              ),
            ],
          );
        } else {
          return const Center(child: Text('Welcome to Banking App!'));
        }
      },
    );
  }
}
