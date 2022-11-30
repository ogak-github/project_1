import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palpay/api/data_services.dart';
import 'package:palpay/app_theme.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../models/contact.dart';

class SendMoney extends StatefulWidget {
  final dataServices = DataServices();
  SendMoney({Key? key}) : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  TextEditingController sendMoneyController = TextEditingController();
  TextEditingController sendToController = TextEditingController();
  @override
  void initState() {
    super.initState();
    sendMoneyController.text;
    sendToController.addListener(() {
      getLatestContacts();
    });
  }

  getLatestContacts() {
    print(sendToController.text);
  }

  @override
  void dispose() {
    sendMoneyController.dispose();
    sendToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text("Send Money", style: AppTheme.lightTextTheme.labelLarge),
        centerTitle: true,
      ),
      body: _sendMoneyBuilder(context),
    );
  }

  Widget _textField() {
    return SizedBox(
      width: 311,
      child: TextField(
        readOnly: true,
        controller: sendMoneyController,
        keyboardType: TextInputType.none,
        decoration: InputDecoration(
            hintText: "0",
            prefixIcon: const Icon(
              Icons.attach_money,
              color: Color.fromRGBO(36, 54, 86, 1),
              size: 40,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        style: GoogleFonts.manrope(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: const Color.fromRGBO(36, 54, 86, 1),
        ),
      ),
    );
  }

  Widget _customNumericKeypad(BuildContext context) {
    List<dynamic> keycaps = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, ".", "back"];
    return MediaQuery.removePadding(
      removeBottom: true,
      removeTop: true,
      context: context,
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: keycaps.length,
          padding: const EdgeInsets.all(40),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (_, index) {
            keycaps[index];
            return _keyButton(keycaps[index]);
          }),
    );
  }

  Widget _keyButton(dynamic keys) {
    return SizedBox(
      height: 72,
      width: 72,
      child: keys != "back"
          ? OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.transparent),
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
              ),
              onPressed: () {
                setState(() {
                  sendMoneyController.text += keys.toString();
                });
              },
              child: Text(
                keys.toString(),
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                  color: const Color.fromRGBO(36, 54, 86, 1),
                ),
              ))
          : OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.transparent),
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
              ),
              onPressed: () {
                if (sendMoneyController.text.isNotEmpty) {
                  setState(() {
                    sendMoneyController.text = sendMoneyController.value.text
                        .substring(
                            0, sendMoneyController.value.text.length - 1);
                    print(sendMoneyController.text);
                  });
                } else {
                  if (kDebugMode) {
                    print("Textfield is empty");
                  }
                }
              },
              icon: const Icon(
                Icons.backspace_outlined,
                color: Colors.black,
              ),
              label: const Text(""),
            ),
    );
  }
/*
  Widget _searchAccount() {
    return DropdownSearch<Contact>(
      popupProps: PopupProps.modalBottomSheet(
        itemBuilder: _customContactDropDown(),
        showSearchBox: true,
      ),
    );
  }*/

  Widget _customContactDropDown(
      BuildContext context, List<Contact?> selectedContact) {
    if (selectedContact.isEmpty) {
      return ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: const CircleAvatar(),
        title: Text("No item selected",
            style: AppTheme.lightTextTheme.titleMedium),
      );
    }
    return Wrap(
      children: selectedContact.map((e) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: CircleAvatar(
                backgroundColor: const Color.fromRGBO(245, 247, 250, 1),
                child: Text(
                  e?.name[0].toLowerCase() ?? '',
                  style: AppTheme.lightTextTheme.titleMedium,
                ),
              ),
              title: Text(
                e?.name ?? '',
                style: AppTheme.lightTextTheme.titleMedium,
              ),
              subtitle: Text(
                e?.username ?? '',
                style: AppTheme.lightTextTheme.labelMedium,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _contactListBuilder() {
    return FutureBuilder(
      future: widget.dataServices.getContacts(),
      builder: (context, AsyncSnapshot<List<Contact>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return _customContactDropDown(context, snapshot.data ?? []);
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
    );
  }

  Widget _sendMoneyBuilder(BuildContext context) {
    return Column(
      children: [
        _textField(),
        SizedBox(
          child: _customNumericKeypad(context),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 311,
              height: 64,
              child: ElevatedButton(
                onPressed: () {
                  sendMoney(sendMoneyController.value.text);
                },
                child: Text(
                  "Send",
                  style: AppTheme.lightTextTheme.displayMedium,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void sendMoney(String value) {
    if (kDebugMode) {
      value.isEmpty
          ? print("Please input some value")
          : print("Successfully send money: $value USD");
    }
  }
}
