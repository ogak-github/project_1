import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palpay/screen/wallet/wallet_screen.dart';
import '../../models/user_data.dart';

class Dashboard extends StatelessWidget {
  final UserData users;
  const Dashboard({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 272,
      width: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/app_img/paypal_background.png"),
          alignment: Alignment(-1, -1),
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
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(41.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(21, 70, 160, 0.5),
            offset: Offset(5, 5),
            blurRadius: 25.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 65,
            left: 32,
            child: Image(
              image: AssetImage('assets/app_img/paypal_logo.png'),
            ),
          ),
          Positioned(
            top: 60,
            right: 32,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WalletScreen()));
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage:
                    AssetImage("assets/app_img/${users.profileImage}"),
                radius: 20,
              ),
            ),
          ),
          Positioned(
            top: 111,
            left: 32,
            child: Text(
              "Hello, ${users.name}",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            top: 165,
            left: 32,
            child: Text(
              "\$ ${users.balance}",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 222,
            left: 32,
            child: Text(
              "Your Balance",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
