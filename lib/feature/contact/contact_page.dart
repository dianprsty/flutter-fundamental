import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/feature/contact/bloc/contact_bloc.dart';
import 'package:flutter_fundamental/feature/contact/contact_form.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ContactBloc>().add(GetContact());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contact"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ContactForm()));
          },
          child: const Icon(Icons.person_add),
        ),
        body: BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
          return switch (state) {
            ContactLoading() =>
              const Center(child: CircularProgressIndicator()),
            ContactSuccess() => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: state.contacts.isEmpty
                          ? const Center(child: Text("Contact is empty"))
                          : ListView.builder(
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                      dense: true,
                                      isThreeLine: true,
                                      leading: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          CircleAvatar(
                                            child: Text(state
                                                    .contacts[index].name?[0] ??
                                                ''),
                                          ),
                                        ],
                                      ),
                                      title: Text(
                                        state.contacts[index].name ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(state.contacts[index].phone ??
                                              ''),
                                          Text(
                                              state.contacts[index].email ?? '')
                                        ],
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ContactForm(
                                                          contact: state
                                                              .contacts[index],
                                                        )),
                                              );
                                            },
                                            child: const Icon(Icons.edit,
                                                size: 16, color: Colors.green),
                                          ),
                                          const SizedBox(width: 16),
                                          GestureDetector(
                                            onTap: () {
                                              context.read<ContactBloc>().add(
                                                  DeleteContact(
                                                      id: state.contacts[index]
                                                              .id ??
                                                          ''));
                                            },
                                            child: const Icon(Icons.delete,
                                                size: 16, color: Colors.red),
                                          )
                                        ],
                                      )),
                                );
                              },
                              itemCount: state.contacts.length,
                            ),
                    ),
                  ),
                ],
              ),
            ContactError() => Center(child: Text(state.message)),
          };
        }),
      ),
    );
  }
}
