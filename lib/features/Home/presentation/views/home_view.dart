import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Home/presentation/manager/BottomNav_Cubit/bottom_nav_cubit.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/home_navbar.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/widgets/credit_cards_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String route = "/homeView";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: klightBackground,
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return _buildScreen(selectedIndex);
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return HomeNavBar(
              selectedIndex: selectedIndex,
              onItemTapped: (index) {
                context.read<BottomNavCubit>().setIndex(index);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildScreen(int selectedIndex) {
    final List<Widget> screens = [
      const HomeViewBody(),
      const CreditCardsViewBody(),
      const Center(child: Text('Profile Screen')),
      const Center(child: Text('Settings Screen')),
    ];

    return screens[selectedIndex];
  }
}