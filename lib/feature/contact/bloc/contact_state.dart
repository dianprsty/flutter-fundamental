part of 'contact_bloc.dart';

sealed class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

final class ContactLoading extends ContactState {}

final class ContactSuccess extends ContactState {
  final List<ContactModel> contacts;

  const ContactSuccess(this.contacts);

  @override
  List<Object> get props => [contacts];
}

final class ContactError extends ContactState {
  final String message;

  const ContactError(this.message);

  @override
  List<Object> get props => [message];
}
