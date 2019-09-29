import 'package:crud/bloc/contact_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ContactState {
  static ContactState _instance;
  factory ContactState() {
    _instance ??= ContactState._internalConstructor();
    return _instance;
  }
  ContactState._internalConstructor();

  var contacts = BehaviorSubject<List<Contact>>();

  fetchContacts() {
    ContactBloc().readContacts().listen((contactStream) {
      contacts.add(contactStream);
    });
  }
}
