import 'package:flutter/material.dart';
import 'package:palpay/api/data_services.dart';
import 'package:palpay/app_theme.dart';
import 'package:palpay/screen/contact/contact_list.dart';
import 'package:palpay/models/contact.dart';

class ContactScreen extends StatelessWidget {
  final appService = DataServices();
  ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back, color: Colors.black),
          //   onPressed: () {},
          // ),
          centerTitle: true,
          title: Text(
            "Contacts",
            style: AppTheme.lightTextTheme.titleMedium,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ))
          ],
        ),
        body: FutureBuilder(
          future: appService.getContacts(),
          builder: (context, AsyncSnapshot<List<Contact>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ContactList(listContacts: snapshot.data!);
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
      ),
    );
  }
}
