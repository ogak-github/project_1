import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palpay/api/data_services.dart';
import 'package:palpay/app_theme.dart';
import 'package:palpay/models/app_state_manager.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  final dataServices = DataServices();
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var about =
      "This application is just an example where I learned to implement UI into android apps using Flutter. "
      "UI/UX Paypal Redesign is the work of";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: about, style: AppTheme.lightTextTheme.bodyLarge),
                  TextSpan(
                      text: " Vladim Demenko",
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        color: const Color.fromRGBO(0, 112, 186, 1),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          const url =
                              'https://dribbble.com/shots/14114443-PayPal-App-Redesign-Conept';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw "Could not launch $url";
                          }
                        }),
                ]),
              ),
            ),
            const SizedBox(height: 45.0),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Provider.of<AppStateManager>(context, listen: false).logout();
                },
                child: SizedBox(
                  width: 100,
                  height: 30,
                  child: Center(
                    child: Text(
                      "Logout",
                      style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
