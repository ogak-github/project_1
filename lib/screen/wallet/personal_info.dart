import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../../models/user_data.dart';

class PersonalInfo extends StatelessWidget {
  late UserData user;
  PersonalInfo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Personal Info", style: AppTheme.lightTextTheme.labelMedium),
            ],
          ),
          const SizedBox(height: 19),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 0),
            visualDensity: const VisualDensity(vertical: -4),
            leading: Text('Name', style: AppTheme.lightTextTheme.bodyLarge),
            title: Text(user.name, style: AppTheme.lightTextTheme.labelLarge),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 0),
            visualDensity: const VisualDensity(vertical: -4),
            leading: Text('E-mail', style: AppTheme.lightTextTheme.bodyLarge),
            title: Text(user.email, style: AppTheme.lightTextTheme.labelLarge),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 0),
            visualDensity: const VisualDensity(vertical: -4),
            leading: Text('Phone', style: AppTheme.lightTextTheme.bodyLarge),
            title: Text(user.phone, style: AppTheme.lightTextTheme.labelLarge),
          ),
        ],
      ),
    );
  }
}
