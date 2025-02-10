import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/CreditCards/data/transactions_list_data.dart';
import 'package:flutter/material.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    super.key,
    required this.itemsNum,
  });
  final int itemsNum;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: (itemsNum > customTransaction.length)
          ? customTransaction.length
          : itemsNum,
      itemBuilder: (context, index) {
        var item = customTransaction[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                item['icon'],
                color: Colors.black,
                size: 16,
              ),
            ),
            contentPadding: const EdgeInsets.all(5),
            title: Text("${item["title"]}", style: Styles.ktextStyle16),
            subtitle: Text("${item["date"]}",
                style: Styles.ktextStyle10.copyWith(color: kborder)),
            trailing: Text("${item["price"].toString()}\$",
                style: Styles.ktextStyle16.copyWith(
                    color: (item['price'] > 0) ? kGreen : Colors.black)),
          ),
        );
      },
    );
  }
}
