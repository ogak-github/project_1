import 'package:flutter/cupertino.dart';
import 'package:palpay/models/main_menu.dart';

class AppStateManager extends ChangeNotifier {
  int _selectedBottomMenu = MainMenu.home;
  bool _loggedIn = false;

  int get getSelectedBottomMenu => _selectedBottomMenu;

  bool get isLoggedIn => _loggedIn;

  void login() {
    _loggedIn = true;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    _selectedBottomMenu = MainMenu.home;
    notifyListeners();
  }

  void goToMenu(index) {
    _selectedBottomMenu = index;
    notifyListeners();
  }
}
