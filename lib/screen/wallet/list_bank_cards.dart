import 'package:flutter/material.dart';
import 'package:palpay/app_theme.dart';
import 'package:palpay/models/bank_card.dart';

class ListBankCards extends StatelessWidget {
  late List<BankCard> bankCard;
  ListBankCards({Key? key, required this.bankCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My Banking Cards",
                  style: AppTheme.lightTextTheme.labelMedium),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                label: Text(
                  "Add",
                  style: AppTheme.lightTextTheme.bodyMedium,
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: bankCard.length,
            itemBuilder: (BuildContext context, int index) {
              //final list = contacts[index];
              final data = bankCard[index];
              return InkWell(
                onTap: () {
                  debugPrint(data.cardId);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image(
                      image: AssetImage(
                          'assets/app_img/${data.cardLogo.toString()}'),
                    ),
                  ),
                  title: Text(
                    data.cardName,
                    style: AppTheme.lightTextTheme.titleMedium,
                  ),
                  subtitle: Text(
                    data.cardNumber.palpayBankCardFormat(),
                    style: AppTheme.lightTextTheme.labelMedium,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

extension on String {
  String palpayBankCardFormat() {
    var data = replaceAll(RegExp(r'(?<=.{2})\d(?=.{4})'), 'x');
    return data.replaceAllMapped(
        RegExp(r".{4}"), (match) => "${match.group(0)} ");
  }
}
