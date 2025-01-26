
import 'package:flutter/material.dart';

class HomeAppBarIcons extends StatelessWidget {
  const HomeAppBarIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.grid_view_sharp,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
