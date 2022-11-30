import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:palpay/models/activity.dart';

import '../../app_theme.dart';

class ActivityList extends StatefulWidget {
  final TabController tabController;
  final List<Activity> activities;
  ActivityList(
      {Key? key, required this.tabController, required this.activities})
      : super(key: key);

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _tabBuilder();
  }

  Widget _tabBuilder() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Column(
        children: [
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: HexColor('#F5F7FA'),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TabBar(
              padding: const EdgeInsets.all(1.0),
              controller: widget.tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color.fromRGBO(0, 112, 186, 1),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              splashBorderRadius: BorderRadius.circular(20.0),
              labelStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'manrope'),
              tabs: const [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: 'Income',
                ),
                Tab(
                  text: "Outcome",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: widget.tabController,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 32),
                  child: _allActivities(widget.activities),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 32),
                  child: _allIncome(widget.activities),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 32),
                  child: _allOutcome(widget.activities),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _allActivities(List<Activity> listActivities) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listActivities.length,
      itemBuilder: (context, int index) {
        final data = listActivities[index];
        return InkWell(
          onTap: () {
            debugPrint(data.id);
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromRGBO(245, 247, 250, 1),
              child: Text(
                listActivities[index].activityName[0].toUpperCase(),
                style: AppTheme.lightTextTheme.titleMedium,
              ),
            ),
            title: Text(data.activityName,
                style: AppTheme.lightTextTheme.titleMedium),
            subtitle:
                Text("2 hours ago", style: AppTheme.lightTextTheme.labelMedium),
            trailing: _expenseIncomeColorString(data.activityType, data.income),
          ),
        );
      },
    );
  }

  Widget _allIncome(List<Activity> listActivities) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listActivities.length,
        itemBuilder: (context, int index) {
          final data = listActivities[index];
          if (data.activityType == "income") {
            return InkWell(
              onTap: () {
                debugPrint(data.id);
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(245, 247, 250, 1),
                  child: Text(
                    listActivities[index].activityName[0].toUpperCase(),
                    style: AppTheme.lightTextTheme.titleMedium,
                  ),
                ),
                title: Text(data.activityName,
                    style: AppTheme.lightTextTheme.titleMedium),
                subtitle: Text("2 hours ago",
                    style: AppTheme.lightTextTheme.labelMedium),
                trailing:
                    _expenseIncomeColorString(data.activityType, data.income),
              ),
            );
          } else {
            return const Center();
          }
        });
  }

  Widget _allOutcome(List<Activity> listActivities) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listActivities.length,
        itemBuilder: (context, int index) {
          final data = listActivities[index];
          if (data.activityType == "expense") {
            return InkWell(
              onTap: () {
                debugPrint(data.id);
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(245, 247, 250, 1),
                  child: Text(
                    listActivities[index].activityName[0].toUpperCase(),
                    style: AppTheme.lightTextTheme.titleMedium,
                  ),
                ),
                title: Text(data.activityName,
                    style: AppTheme.lightTextTheme.titleMedium),
                subtitle: Text("2 hours ago",
                    style: AppTheme.lightTextTheme.labelMedium),
                trailing:
                    _expenseIncomeColorString(data.activityType, data.income),
              ),
            );
          } else {
            return const Center();
          }
        });
  }

  Widget _expenseIncomeColorString(String activityType, String income) {
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
}
