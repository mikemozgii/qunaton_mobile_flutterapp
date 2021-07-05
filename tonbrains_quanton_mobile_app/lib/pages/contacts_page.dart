import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/controls/controls_animations.dart';
import 'package:tonbrains_quanton_mobile_app/pages/generate_token_page.dart';
import 'package:tonbrains_quanton_mobile_app/proto_services/ton_mobile.pbgrpc.dart';
import 'package:tonbrains_quanton_mobile_app/services/api.dart';

class ContactsPage extends StatefulWidget {
  @override
  State createState() => ContactsPageState();
}

class ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts;
  List<String> _emails;
  List<String> _phones;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Contact"),
        iconTheme: IconThemeData(color: AppTheme.brandGrey),
        centerTitle: true,
      ),
      body: _contacts != null
          ? ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: ListTile(
                    leading: Icon(Icons.contact_mail, color: AppTheme.red),
                    title: Row(children: [
                      Text(_contacts[index].displayName),
                      SizedBox(width: 10),
                      if (contactExists(_contacts[index]))
                        Icon(Icons.check, color: AppTheme.red)
                    ]),
                    subtitle: Text(getContact(_contacts[index])),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GenerateTokenScreen(
                                mode: getContactMode(_contacts[index]),
                                contact: getContact(_contacts[index]))));
                  },
                );
              })
          : getLoadingWidget(),
    );
  }

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future loadContacts() async {
    if (await Permission.contacts.request().isGranted) {
      var contacts = (await ContactsService.getContacts()).toList();

      await prepareApiSession(
          (ClientChannel channel, Map<String, String> options) async {
        final client = TonMobileClient(channel);
        var request = ExistContactsRequest();

        contacts.forEach(
            (e) => request.emails.addAll(e.emails.map((i) => i.value)));
        contacts.forEach(
            (e) => request.phones.addAll(e.phones.map((i) => i.value)));

        final result =
            await client.existContacts(request, options: apiOptions(options));

        _emails = result.emails;
        _phones = result.phones;

        _contacts = List<Contact>();
        _contacts.addAll(contacts.where((e) => contactExists(e)));
        _contacts.addAll(contacts.where((e) => !contactExists(e)));

        setState(() {});
      }, withLogs: false);
    } else {
      Navigator.pop(context);
    }
  }

  bool contactExists(Contact contact) {
    return contact.emails.any((e) => _emails.contains(e.value)) ||
        contact.phones.any((e) => _phones.contains(e.value));
  }

  String getContact(Contact contact) {
    var emails = contact.emails.where((e) => _emails.contains(e.value));
    var phones = contact.phones.where((e) => _phones.contains(e.value));

    if (emails.isNotEmpty) return emails.first.value;
    if (phones.isNotEmpty) return phones.first.value;

    return contact.emails.length > 0
        ? contact.emails.first.value
        : contact.phones.first.value;
  }

  String getContactMode(Contact contact) {
    var emails = contact.emails.where((e) => _emails.contains(e.value));
    var phones = contact.phones.where((e) => _phones.contains(e.value));

    if (emails.isNotEmpty) return "email";
    if (phones.isNotEmpty) return "phone";

    return contact.emails.length > 0 ? "email" : "phone";
  }
}
