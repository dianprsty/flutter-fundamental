import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_fundamental/core/data/entity/contact_model.dart';
import 'package:flutter_fundamental/core/data/remote/firebase/contact/contact_repository.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;
  ContactBloc({required this.contactRepository}) : super(ContactLoading()) {
    on<GetContact>((event, emit) async {
      emit(ContactLoading());

      try {
        print("something");
        final contacts = await contactRepository.getContacts();
        print("something 2");

        print(contacts.toString());
        emit(ContactSuccess(contacts ?? []));
      } catch (e) {
        print(e.toString());
        emit(ContactError(e.toString()));
      }
    });
  }
}
