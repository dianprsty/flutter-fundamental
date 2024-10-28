import 'dart:developer';

import 'package:flutter/material.dart';

class BasicWidget extends StatelessWidget {
  const BasicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/profile.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 40),
            const Text(
              "Sebuah text",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontFamily: 'Pockota',
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(12)),
              child: const Row(
                children: [
                  Icon(Icons.add),
                  Icon(Icons.remove),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.blue,
                    size: 60,
                  ),
                  Icon(Icons.delete),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Email.",
                    label: const Text("Email"),
                  ),
                )),
            const SizedBox(height: 40),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(12)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                  onPressed: () {
                    log("Button pressed");
                  },
                  child: const Text(
                    "Button",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
