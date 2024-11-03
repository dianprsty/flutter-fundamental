import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/demo/layout_page.dart';
import 'package:flutter_fundamental/feature/main/main_page.dart';
import 'package:flutter_fundamental/feature/profile/profile_page.dart';
import 'package:flutter_fundamental/feature/saved/saved_page.dart';
import 'package:flutter_fundamental/feature/demo/scrollable_page.dart';
import 'package:flutter_fundamental/feature/user_interaction/input_and_form/input_and_form.dart';
import 'package:flutter_fundamental/feature/user_interaction/notification_and_confirmation/notification_and_confirmation.dart';
import 'package:flutter_fundamental/feature/user_interaction/picker/picker.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => const MainPage(),
  '/saved': (context) => const SavedPage(),
  '/profile': (context) => const ProfilePage(),
  '/layout': (context) => const LayoutPage(),
  '/scrollable': (context) => const ScrollablePage(),
  '/input': (context) => const InputAndForm(),
  '/notification': (context) => const NotificationAndConfirmation(),
  '/picker': (context) => const Picker(),
};
