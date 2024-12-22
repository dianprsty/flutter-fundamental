part of 'contact_bloc.dart';

sealed class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class GetContact extends ContactEvent {}

class AddContact extends ContactEvent {
  final String name;
  final String email;
  final String phone;

  const AddContact(
      {required this.name, required this.email, required this.phone});
}

class UpdateContact extends ContactEvent {
  final String id;
  final String name;
  final String email;
  final String phone;

  const UpdateContact(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone});
}

class DeleteContact extends ContactEvent {
  final String id;

  const DeleteContact({required this.id});
}
