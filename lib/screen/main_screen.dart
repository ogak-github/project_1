import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:palpay/models/app_state_manager.dart';
import 'package:palpay/navigation/app_pages.dart';
import 'package:palpay/screen/contact/contact_screen.dart';
import 'package:palpay/screen/home/home.dart';
import 'package:palpay/screen/settings/setting_screen.dart';
import 'package:palpay/screen/wallet/wallet_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static MaterialPage page(int currentScreen) {
    return MaterialPage(
      name: AppPages.homePage,
      key: ValueKey(AppPages.homePage),
      child: MainScreen(
        currentScreen: currentScreen,
      ),
    );
  }

  final currentScreen;
  const MainScreen({Key? key, required this.currentScreen}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static List<Widget> pages = <Widget>[
    Home(),
    ContactScreen(),
    WalletScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.currentScreen,
        children: pages,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            activeColor: const Color.fromRGBO(0, 112, 186, 1),
            gap: 8,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            selectedIndex: widget.currentScreen,
            onTabChange: (index) {
              Provider.of<AppStateManager>(context, listen: false)
                  .goToMenu(index);
            },
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.people_alt_outlined,
                text: 'Contacts',
              ),
              GButton(
                icon: Icons.account_balance_wallet_outlined,
                text: 'Wallet',
              ),
              GButton(
                icon: Icons.settings_outlined,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
