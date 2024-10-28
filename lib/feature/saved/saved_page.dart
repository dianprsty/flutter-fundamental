import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/profile/profile_page.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Saved Page'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: const Text('Go to Profile')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/layout');
                },
                child: const Text('Go to Layout')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/scrollable');
                },
                child: const Text('Go to Scrollabe')),
          ],
        ),
      ),
    );
  }
}
