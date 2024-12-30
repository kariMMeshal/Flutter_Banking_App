import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/home_custom_appbar.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/salary_progress_indecator.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        HomeCustomAppbar(currentBalance: 2000),
        Padding(
          padding: const EdgeInsets.only(left: 20 , top: 20),
          child: Text(
            "Usage : ",
            style: Styles.ktextStyle18,
          ),
        ),
        SalaryProgressIndicator(totalSalary: 5000, remainingSalary: 2000),
      ],
    );
  }
}
