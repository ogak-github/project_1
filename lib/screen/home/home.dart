import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palpay/api/data_services.dart';
import 'package:palpay/app_theme.dart';
import 'package:palpay/models/activity.dart';
import 'package:palpay/models/user_data.dart';
import 'package:palpay/screen/activity/activity_screen.dart';
import 'package:palpay/screen/home/dashboard.dart';
import 'package:palpay/screen/home/send_money.dart';

class Home extends StatefulWidget {
  final dataServices = DataServices();
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<UserData> userData;
  @override
  void initState() {
    super.initState();
    userData = widget.dataServices.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: userData,
          builder: (context, AsyncSnapshot<UserData> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Dashboard(
                        users: snapshot.data!,
                      ),
                      const SizedBox(height: 24.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 32, right: 32),
                        child: _actionWidget(),
                      ),
                      const SizedBox(height: 29),
                      Padding(
                        padding: const EdgeInsets.only(left: 32, right: 32),
                        child: Stack(
                          children: [
                            Positioned(
                              child: _listActivity(
                                  snapshot.data?.activities ?? []),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text("No Data"),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget _listActivity(List<Activity> activities) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Activity",
                style: AppTheme.lightTextTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActivityScreen()),
                  );
                },
                child: Text(
                  "View All",
                  style: AppTheme.lightTextTheme.labelMedium,
                ),
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: activities.length,
            itemBuilder: (context, int index) {
              final data = activities[index];
              return InkWell(
                onTap: () {
                  debugPrint(data.id);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(245, 247, 250, 1),
                    child: Text(
                      activities[index].activityName[0].toUpperCase(),
                      style: AppTheme.lightTextTheme.titleMedium,
                    ),
                  ),
                  title: Text(data.activityName,
                      style: AppTheme.lightTextTheme.titleMedium),
                  subtitle: Text("2 hours ago",
                      style: AppTheme.lightTextTheme.labelMedium),
                  trailing: _expenseIncome(data.activityType, data.income),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _expenseIncome(String activityType, String income) {
    if (activityType == "expense") {
      return Text(
        "-\$ $income",
        style: GoogleFonts.manrope(
            color: Colors.red, fontWeight: FontWeight.w400, fontSize: 12.0),
      );
    } else {
      return Text(
        "+\$ $income",
        style: GoogleFonts.manrope(
            color: Colors.green, fontWeight: FontWeight.w400, fontSize: 12.0),
      );
    }
  }

  Widget _actionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonSendMoney(),
        _buttonRequestPayment(),
        _moreButton(),
      ],
    );
  }

  Widget _moreButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black54,
      ),
    );
  }

  Widget _buttonSendMoney() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SendMoney()));
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(21, 70, 160, 0.5),
            ),
          ],
        ),
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, top: 20, right: 30, bottom: 17),
          height: 120,
          width: 107,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage("assets/app_img/upload-icon-alt.png"),
                alignment: Alignment.topLeft,
              ),
              Text(
                "Send Money",
                textAlign: TextAlign.start,
                style: AppTheme.lightTextTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonRequestPayment() {
    return OutlinedButton(
      onPressed: () {},
      child: Ink(
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, top: 20, right: 25, bottom: 17),
          height: 120,
          width: 107,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage("assets/app_img/receive-icon-alt.png"),
                alignment: Alignment.topLeft,
              ),
              Text(
                "Request Payment",
                textAlign: TextAlign.start,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0,
                  color: const Color.fromRGBO(0, 112, 186, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
