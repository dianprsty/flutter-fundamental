import 'dart:developer';

import 'package:flutter/material.dart';

List<Widget> list = List.generate(100, (index) {
  log("Item $index");
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(8),
    width: 100,
    color: Colors.white,
    child: Text("Item $index"),
  );
});

class ScrollablePage extends StatelessWidget {
  const ScrollablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        child: ListView.separated(
          itemCount: 100,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            log("Item $index");
            return Container(
              padding: const EdgeInsets.all(8),
              width: 100,
              color: Colors.blue,
              child: Text("Item $index"),
            );
          },
        ),
      ),
    ));
  }
}

class SingleChild extends StatelessWidget {
  const SingleChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: Colors.blue,
        child: Column(
          children: [
            ...list,
          ],
        ),
      ),
    );
  }
}
