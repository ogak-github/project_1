import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:palpay/app_theme.dart';
import 'package:palpay/models/app_state_manager.dart';
import 'package:palpay/navigation/app_pages.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: AppPages.loginPage,
        key: ValueKey(AppPages.loginPage),
        child: const LoginScreen());
  }

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.fromLTRB(90, 131, 90, 98),
                child: const Image(
                  image: AssetImage('assets/app_img/logo.png'),
                ),
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.fromLTRB(57, 276, 57, 0),
                child: _buildLoginForm(context),
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.fromLTRB(111, 567, 111, 0),
                child: _txtButtons(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            maxLines: 1,
            style: AppTheme.lightTextTheme.bodyMedium,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Enter your username or e-mail",
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            maxLines: 1,
            obscureText: true,
            style: AppTheme.lightTextTheme.bodyMedium,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Password",
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          _loginButton(context),
        ],
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<AppStateManager>(context, listen: false).login();
      },
      child: Ink(
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            focal: Alignment(-1, -3),
            radius: 2.1,
            colors: [
              Color.fromRGBO(0, 112, 186, 1),
              Color.fromRGBO(21, 70, 160, 1)
            ],
          ),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(21, 70, 160, 0.5),
            ),
          ],
        ),
        child: Container(
          alignment: Alignment.center,
          height: 64,
          width: 261,
          child: Text(
            "Log In",
            textAlign: TextAlign.center,
            style: AppTheme.lightTextTheme.displayMedium,
          ),
        ),
      ),
    );
  }

  Widget _txtButtons() {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Having trouble logging in ?",
            textAlign: TextAlign.center,
            style: AppTheme.lightTextTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 29.0,
        ),
        const SizedBox(
            width: 65, child: Divider(thickness: 2, color: Colors.grey)),
        const SizedBox(height: 22.0),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: AppTheme.lightTextTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
