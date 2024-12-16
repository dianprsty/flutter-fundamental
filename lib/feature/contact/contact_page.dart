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
            ContactLoading() => CircularProgressIndicator(),
            ContactSuccess() => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.blue.shade200,
                            child: ListTile(
                              dense: true,
                              isThreeLine: true,
                              leading: CircleAvatar(
                                child: Text(state.contacts[index].name[0]),
                              ),
                              title: Text(state.contacts[index].name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.contacts[index].phone),
                                  Text(state.contacts[index].email)
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: state.contacts.length,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<ContactBloc>().add(GetContact());
                      },
                      child: Text("Refresh"))
                ],
              ),
            ContactError() => Text(state.message),
          };
        }),
      ),
    );
  }
}
