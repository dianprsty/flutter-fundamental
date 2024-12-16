import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fundamental/core/data/entity/contact_model.dart';

class ContactRepository {
  final contactCollection = FirebaseFirestore.instance.collection('contacts');

  Future<List<ContactModel>?> getContacts() async {
    final docRef = contactCollection.doc("list");

    List<ContactModel> contacts = [];
    await docRef.get().then((doc) {
      if (doc.exists) {
        final list = doc.data()?["contacts"] as List;

        for (var contact in list) {
          final contactModel = ContactModel.fromMap(contact);

          contacts.add(contactModel);
        }

        print(contacts);
      }
    });
    return contacts;
  }

  Future<void> addContact(String name, String email, String phone) async {
    await contactCollection.add({
      'name': name,
      'email': email,
      'phone': phone,
    });
  }
}
