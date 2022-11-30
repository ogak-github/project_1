import 'package:flutter/material.dart';
import 'package:palpay/api/data_services.dart';
import 'package:palpay/app_theme.dart';
import 'package:palpay/screen/wallet/list_bank_cards.dart';
import 'package:palpay/screen/wallet/personal_info.dart';

import '../../models/user_data.dart';

class WalletScreen extends StatefulWidget {
  final dataService = DataServices();
  WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late Future<UserData> users;
  @override
  void initState() {
    super.initState();
    users = widget.dataService.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title:
            Text("Your Wallet", style: AppTheme.lightTextTheme.displayMedium),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {},
        // ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      body: FutureBuilder(
          future: users,
          builder: (context, AsyncSnapshot<UserData> snapshot) {
            final snapshotData = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("No Data"),
                );
              } else {
                return _mainWidget(context, snapshotData!);
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget _mainWidget(context, UserData data) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 192,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/app_img/paypal_background.png"),
                  alignment: Alignment(-2.3, -1),
                  fit: BoxFit.fill,
                  centerSlice: Rect.zero,
                  scale: 1,
                  opacity: 0.1,
                ),
                gradient: RadialGradient(
                  focal: Alignment(-1, -3),
                  radius: 2.1,
                  colors: [
                    Color.fromRGBO(0, 112, 186, 1),
                    Color.fromRGBO(21, 70, 160, 1)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 97,
            left: 114,
            right: 114,
            child: CircleAvatar(
              radius: 75,
              backgroundImage:
                  AssetImage("assets/app_img/${data.profileImage}"),
              backgroundColor: Colors.transparent,
            ),
          ),
          Positioned(
            top: 275,
            left: 32,
            right: 32,
            child: PersonalInfo(
              user: data,
            ),
          ),
          Positioned(
            top: 467,
            left: 32,
            right: 32,
            child: ListBankCards(
              bankCard: data.bankCards,
            ),
          ),
        ],
      ),
    );
  }
}
