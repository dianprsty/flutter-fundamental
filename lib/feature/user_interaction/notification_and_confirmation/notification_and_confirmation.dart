import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationAndConfirmation extends StatelessWidget {
  const NotificationAndConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification & Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.fixed,
                    duration: const Duration(milliseconds: 700),
                    backgroundColor: Colors.green,
                    action: SnackBarAction(
                      label: 'confirm',
                      onPressed: () {},
                    ),
                    showCloseIcon: true,
                    content: const Text('ini snackbar'),
                  ),
                );
              },
              child: const Text('snack bar'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    backgroundColor: Colors.blue,
                    content: const Text('banner message'),
                    actions: [
                      TextButton(
                        child: const Text('accept'),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: const Text('close'),
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        },
                      )
                    ],
                  ),
                );
              },
              child: const Text('Material Banner'),
            ),
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "This is Center Short Toast",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM_RIGHT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    // textColor: Colors.s,
                    fontSize: 16.0);
              },
              child: const Text('Toast'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text('Pilih Bahasa'),
                      children: [
                        SimpleDialogOption(
                          child: const Text('Bahasa Indonesia'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SimpleDialogOption(
                          child: const Text('English'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Simple Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Hapus Data'),
                        content: const Text(
                            'Apakah anda yakin ingin menhapus data?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                log('data terhapus');
                                Navigator.pop(context);
                              },
                              child: const Text('Yes')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No')),
                        ],
                      );
                    });
              },
              child: const Text('Alert Dialog'),
            ),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    // backgroundColor: Colors.white,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(24),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 8),
                                const Text(
                                  'Comment',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 24),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 100,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        leading: CircleAvatar(
                                          radius: 24,
                                          backgroundImage: NetworkImage(
                                              'https://i.pravatar.cc/$index'),
                                        ),
                                        title: Text(
                                          'User${index + 1}',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                            'This is Comment from user ${index + 1}'),
                                        trailing: const Icon(
                                          Icons.favorite,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 60)
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.only(top: 8),
                                color: Colors.white,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    labelText: 'Comment',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.send),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text('Bottom Sheet')),
          ],
        ),
      ),
    );
  }
}
