import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:palpay/api/data_services.dart';
import 'package:palpay/app_theme.dart';
import 'package:palpay/screen/activity/activity_list.dart';

import '../../models/activity.dart';

class ActivityScreen extends StatefulWidget {
  final dataServices = DataServices();
  ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<List<Activity>> _activities;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _activities = widget.dataServices.getActivities();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Activity",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded, color: Colors.black),
          )
        ],
      ),
      body: FutureBuilder(
        future: widget.dataServices.getActivities(),
        builder: (context, AsyncSnapshot<List<Activity>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data?.length);
              return ActivityList(
                  tabController: _tabController, activities: snapshot.data!);
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: AppTheme.lightTextTheme.titleLarge,
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
