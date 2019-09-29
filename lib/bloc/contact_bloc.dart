import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/subjects.dart';

class ContactBloc {
  ContactBloc();

  createContact() {}

  BehaviorSubject<List<Contact>> readContacts() {
    var contactsStream = BehaviorSubject<List<Contact>>();
    Firestore()
        .collection("contacts")
        .document("UXVRgxoKN51DII6Zv4Ha")
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        var doc = (snapshot.data['contacts'] as List);
        var contacts = List<Contact>();

        doc.forEach((item) {
          var contact = Contact()
            ..email = item['email'] ?? null
            ..name = item['name'] ?? null
            ..id = doc.indexOf(item) ?? null;

          contacts.add(contact);
          contactsStream.add(contacts);
        });
      }
    });
    return contactsStream;
  }

  updateContact() {}
  deleteContact() {}
}

class Contact {
  int id;
  String email;
  String name;
}
