import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/profile.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 40),
            const Text(
              'Dian Prasetyo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'dprasmail@gmail.com',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),
            const Divider(),
            profileItem('Update Profile',
                icon: const Icon(Icons.person, size: 20)),
            const Divider(),
            profileItem('Change Password',
                icon: const Icon(Icons.lock, size: 20)),
            const Divider(),
            profileItem('Settings', icon: const Icon(Icons.settings, size: 20)),
            const Divider(),
            profileItem('About Us',
                icon: const Icon(Icons.question_mark_outlined, size: 20)),
            const Divider(),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.logout, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget profileItem(String title, {VoidCallback? onTap, Widget? icon}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon ?? const SizedBox.shrink(),
            const SizedBox(width: 16),
            Expanded(child: Text(title)),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
