import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/features/Home/presentation/manager/Wallet_Cubit/wallet_cubit.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/home_custom_appbar.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/salary_progress_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state is WalletLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WalletError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is WalletUpdated) {
          final currentBalance = state.remainingAmount;
          final totalSalary = state.totalSalary;

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              HomeCustomAppbar(currentBalance: currentBalance),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text("Usage : ", style: Styles.ktextStyle18),
              ),
              SalaryProgressIndicator(
                totalSalary: totalSalary,
                remainingSalary: currentBalance,
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
