import 'package:banking_app2/features/Home/presentation/views/widgets/home_custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        HomeCustomAppbar(),
      ],
    );
  }
}
