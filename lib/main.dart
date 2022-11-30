import 'package:flutter/material.dart';
import 'package:palpay/app_theme.dart';
import 'package:palpay/models/app_state_manager.dart';
import 'package:palpay/models/main_menu.dart';
import 'package:palpay/navigation/app_router.dart';
import 'package:palpay/screen/contact/contact_screen.dart';
import 'package:palpay/screen/login/login_screen.dart';
import 'package:palpay/screen/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appStateManager = AppStateManager();

  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(appStateManager: _appStateManager);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _appStateManager),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        home: Router(
          routerDelegate: _appRouter,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
