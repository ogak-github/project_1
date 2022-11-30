import 'package:flutter/material.dart';
import 'package:palpay/app_theme.dart';
import 'package:palpay/models/contact.dart';

class ContactList extends StatefulWidget {
  final List<Contact> listContacts;

  const ContactList({Key? key, required this.listContacts}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final TextEditingController _searchField = TextEditingController();
  final List<Contact> _searchResult = <Contact>[];

  @override
  void initState() {
    super.initState();
    widget.listContacts;
  }

  @override
  void dispose() {
    _searchField.dispose();
    super.dispose();
  }

  void searchContact(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchResult.clear();
        widget.listContacts;
      });
    } else {
      for (var data in widget.listContacts) {
        if (data.name
            .substring(0, 4)
            .toLowerCase()
            .contains(query.toLowerCase())) {
          setState(() {
            //widget.listContacts.clear();
            _searchResult.add(data);
          });
          return;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) async {
                  searchContact(value);
                },
                controller: _searchField,
                maxLines: 1,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_rounded),
                  hintText: "Enter a name or e-mail",
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            _searchResult.isNotEmpty || _searchField.text.isNotEmpty
                ? _listItem(_searchResult)
                : _listItem(widget.listContacts),
          ],
        ),
      ),
    );
  }

  Widget _listItem(List<Contact> contacts) {
    //contacts.sort((a, b) => a.name.compareTo(b.name));
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        final list = contacts[index];
        //contacts[index].name.compareTo(contacts[index].name);
        return InkWell(
          onTap: () {
            debugPrint(list.id);
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromRGBO(245, 247, 250, 1),
              child: Text(
                list.name[0].toUpperCase(),
                style: AppTheme.lightTextTheme.titleMedium,
              ),
            ),
            title: Text(
              list.name,
              style: AppTheme.lightTextTheme.titleMedium,
            ),
            subtitle: Text(
              list.username.toString(),
              style: AppTheme.lightTextTheme.labelMedium,
            ),
          ),
        );
      },
    );
  }
}
