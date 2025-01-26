import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/CreditCards/data/transactions_list_data.dart';
import 'package:flutter/material.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: customTransaction.length,
        itemBuilder: (context, index) {
          var item = customTransaction[index];
          return Card(
            color: klightBackground,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.grey.shade50),
            ),
            child: ListTile(
              leading: Icon(
                item['icon'],
                color: Colors.green.shade700,
              ),
              contentPadding: const EdgeInsets.all(10),
              title: Text("${item["title"]}", style: Styles.ktextStyle18),
              subtitle: Text("${item["date"]}",
                  style: Styles.ktextStyle12.copyWith(color: kborder)),
              trailing: Text("\$ ${item["price"].toString()}",
                  style: Styles.ktextStyle12
                      .copyWith(color: Colors.blue.shade900)),
            ),
          );
        },
      ),
    );
  }
}
