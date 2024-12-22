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
        final contacts = await contactRepository.getContacts();

        emit(ContactSuccess(contacts ?? []));
      } catch (e) {
        emit(ContactError(e.toString()));
      }
    });
    on<AddContact>((event, emit) async {
      emit(ContactLoading());
      try {
        await contactRepository.addContact(
          event.name,
          event.email,
          event.phone,
        );
        add(GetContact());
      } catch (e) {
        log(e.toString());
        emit(ContactError(e.toString()));
      }
    });
    on<UpdateContact>((event, emit) async {
      emit(ContactLoading());
      try {
        await contactRepository.updateContact(
          event.id,
          event.name,
          event.email,
          event.phone,
        );
        add(GetContact());
      } catch (e) {
        log(e.toString());
        emit(ContactError(e.toString()));
      }
    });
    on<DeleteContact>((event, emit) async {
      emit(ContactLoading());
      try {
        await contactRepository.deleteContact(event.id);
        add(GetContact());
      } catch (e) {
        log(e.toString());
        emit(ContactError(e.toString()));
      }
    });
  }
}
