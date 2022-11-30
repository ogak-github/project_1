import 'package:flutter/cupertino.dart';
import 'package:palpay/models/app_state_manager.dart';
import 'package:palpay/screen/login/login_screen.dart';
import 'package:palpay/screen/main_screen.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final AppStateManager appStateManager;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isLoggedIn) LoginScreen.page(),
        if (appStateManager.isLoggedIn)
          MainScreen.page(appStateManager.getSelectedBottomMenu)
      ],
    );
  }

  AppRouter({
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    super.dispose();
    appStateManager.removeListener(notifyListeners);
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    return;
  }
}
