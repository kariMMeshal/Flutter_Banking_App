import 'package:banking_app2/features/Home/presentation/views/widgets/nav_bar_container.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const HomeNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return NavBarContainer(
      children: [
        NavItem(
          index: 0,
          selectedIndex: selectedIndex,
          icon: FontAwesomeIcons.house,
          label: 'Home',
          onItemTapped: onItemTapped,
        ),
        NavItem(
          index: 1,
          selectedIndex: selectedIndex,
          icon: FontAwesomeIcons.solidCreditCard,
          label: 'Cards',
          onItemTapped: onItemTapped,
        ),
        NavItem(
          index: 2,
          selectedIndex: selectedIndex,
          icon: Icons.person,
          label: 'Profile',
          onItemTapped: onItemTapped,
        ),
        NavItem(
          index: 3,
          selectedIndex: selectedIndex,
          icon: Icons.settings,
          label: 'Settings',
          onItemTapped: onItemTapped,
        ),
      ],
    );
  }
}
