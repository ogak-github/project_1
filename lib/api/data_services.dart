import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:palpay/models/contact.dart';
import 'package:palpay/models/user_data.dart';

import '../models/activity.dart';

class DataServices {
  Future<List<UserData>> getUser() async {
    await Future.delayed(const Duration(milliseconds: 300));

    final dataString =
        await _loadAsset('assets/sample_data/sample_user_data,json');

    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['users'] != null) {
      final users = <UserData>[];
      json['users'].forEach((v) {
        users.add(UserData.fromJson(v));
      });
      return users;
    } else {
      return [];
    }
  }

  Future<List<Activity>> getActivities() async {
    await Future.delayed(const Duration(milliseconds: 300));

    final dataString =
        await _loadAsset('assets/sample_data/sample_activity.json');
    final Map<String, dynamic> json = jsonDecode(dataString);
    if (json['activities'] != null) {
      final activities = <Activity>[];
      json['activities'].forEach((v) {
        activities.add(Activity.fromJson(v));
      });
      return activities;
    } else {
      return [];
    }
  }

  Future<UserData> getUserData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final dataString =
        await _loadAsset('assets/sample_data/sample_user_data.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['users'] != null) {
      final user = <UserData>[];
      json['users'].forEach((v) {
        user.add(UserData.fromJson(v));
      });
      return user[0];
    } else {
      return json['users'];
    }
  }

  Future<List<Contact>> getContacts() async {
    await Future.delayed(const Duration(milliseconds: 300));

    final dataString = await _loadAsset(
      'assets/sample_data/sample_contacts.json',
    );

    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['contact'] != null) {
      final contacts = <Contact>[];
      json['contact'].forEach((v) {
        contacts.add(Contact.fromJson(v));
      });
      return contacts;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
