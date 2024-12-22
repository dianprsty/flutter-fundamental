import 'package:flutter/material.dart';
import 'package:flutter_fundamental/core/data/entity/contact_model.dart';
import 'package:flutter_fundamental/feature/contact/bloc/contact_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactForm extends StatefulWidget {
  final ContactModel? contact;
  const ContactForm({super.key, this.contact});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.contact != null) {
      _nameController.text = widget.contact!.name ?? '';
      _emailController.text = widget.contact!.email ?? '';
      _phoneController.text = widget.contact!.phone ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 60),
          Text(
            "${widget.contact != null ? 'Update' : 'Add'} Contact",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'Phone'),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              if (_nameController.text.isEmpty ||
                  _emailController.text.isEmpty ||
                  _phoneController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Please fill all the fields'),
                    backgroundColor: Colors.red.shade400,
                  ),
                );
                return;
              }
              if (widget.contact != null) {
                context.read<ContactBloc>().add(UpdateContact(
                      id: widget.contact!.id ?? '',
                      name: _nameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                    ));
              } else {
                context.read<ContactBloc>().add(AddContact(
                      name: _nameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                    ));
              }

              Fluttertoast.showToast(
                msg: "Contact ${widget.contact != null ? 'updated' : 'added'}",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blue.shade700,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              Navigator.pop(context);
            },
            child: const Text('Submit', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
