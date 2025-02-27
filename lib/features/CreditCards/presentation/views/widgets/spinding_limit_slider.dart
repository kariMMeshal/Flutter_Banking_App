import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Home/presentation/manager/Wallet_Cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpendingLimitSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double spendingLimit;

  const SpendingLimitSlider({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.spendingLimit,
  });

  @override
  SpendingLimitSliderState createState() => SpendingLimitSliderState();
}

class SpendingLimitSliderState extends State<SpendingLimitSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.spendingLimit;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("      Amount : \$${_currentValue.toStringAsFixed(0)}",
              style: Styles.ktextStyle14),
          SliderTheme(
            data: SliderTheme.of(context)
                .copyWith(tickMarkShape: SliderTickMarkShape.noTickMark),
            child: Slider(
              min: widget.minValue,
              max: widget.maxValue,
              value: _currentValue,
              divisions: 10,
              label: _currentValue.toStringAsFixed(0),
              activeColor: kLightBlue,
              inactiveColor: Colors.white,
              thumbColor: kBlue,
              onChanged: (value) {
                setState(() {
                  _currentValue = value;
                });
                BlocProvider.of<WalletCubit>(context)
                    .updateMonthlyLimit(newLimit: value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${widget.minValue.toStringAsFixed(0)}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text("\$${_currentValue.toStringAsFixed(0)}",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold)),
                Text("\$${widget.maxValue.toStringAsFixed(0)}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
