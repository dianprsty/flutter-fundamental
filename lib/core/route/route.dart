import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/demo/layout_page.dart';
import 'package:flutter_fundamental/feature/main/main_page.dart';
import 'package:flutter_fundamental/feature/profile/profile_page.dart';
import 'package:flutter_fundamental/feature/saved/saved_page.dart';
import 'package:flutter_fundamental/feature/demo/scrollable_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => const MainPage(),
  '/saved': (context) => const SavedPage(),
  '/profile': (context) => const ProfilePage(),
  '/layout': (context) => const LayoutPage(),
  '/scrollable': (context) => const ScrollablePage(),
};
