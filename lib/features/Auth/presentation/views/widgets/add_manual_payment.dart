import 'package:banking_app2/core/common/widgets/custom_textfield.dart';
import 'package:banking_app2/features/Home/presentation/manager/Wallet_Cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddManualPayment extends StatefulWidget {
  const AddManualPayment({super.key});
  static const String route = '/addManualPayment';

  @override
  AddManualPaymentState createState() => AddManualPaymentState();
}

class AddManualPaymentState extends State<AddManualPayment> {
  final TextEditingController itemController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  int quantity = 1;

  @override
  void dispose() {
    itemController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void _submitPayment(BuildContext context) {
    final String item = itemController.text.trim();
    final double? price = double.tryParse(priceController.text.trim());

    if (item.isEmpty || price == null || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid item and price")),
      );
      return;
    }
    final double totalAmount = price * quantity;
    context.read<WalletCubit>().decreaseAmount(value: totalAmount);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              "Payment of \$${totalAmount.toStringAsFixed(2)} for $item added")),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Manual Payment")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            children: [
              CustomTextfield(hint: "Item", myController: itemController),
              CustomTextfield(hint: "Price", myController: priceController),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() => quantity--);
                      }
                    },
                  ),
                  Text(
                    "Quantity : $quantity",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() => quantity++);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
                onPressed: () => _submitPayment(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text("Submit Payment",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
