import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                        width: 3,
                      )),
                  child: const Text("Ini text"),
                ),
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                        width: 3,
                      )),
                  child: const Text("Ini text"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    )),
                child: const Text("Ini text"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
