import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fundamental/core/data/entity/contact_model.dart';

class ContactRepository {
  final collectionReference = FirebaseFirestore.instance.collection('contacts');

  Future<List<ContactModel>?> getContacts() async {
    List<ContactModel> contacts = [];

    await collectionReference.get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        final contactModel = ContactModel.fromMap(doc.data());
        contacts.add(contactModel);
      }
    });

    return contacts;
  }

  Future<void> addContact(String name, String email, String phone) async {
    final docRef = collectionReference.doc();
    await docRef.set({
      "id": docRef.id,
      "name": name,
      "email": email,
      "phone": phone,
    });
  }

  Future<void> updateContact(
      String id, String name, String email, String phone) async {
    final docRef = collectionReference.doc(id);
    await docRef.set({
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    });
  }

  Future<void> deleteContact(String id) async {
    await collectionReference.doc(id).delete();
  }
}
