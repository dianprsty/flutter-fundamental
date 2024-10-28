import 'package:flutter/material.dart';
import 'package:flutter_fundamental/core/widget/bottom_nav_bar.dart';
import 'package:flutter_fundamental/core/widget/bottom_nav_item.dart';
import 'package:flutter_fundamental/feature/home/page/home_page.dart';
import 'package:flutter_fundamental/feature/demo/layout_page.dart';
import 'package:flutter_fundamental/feature/profile/profile_page.dart';
import 'package:flutter_fundamental/feature/saved/saved_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  int _selectedPage = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SavedPage(),
    const ProfilePage(),
    const LayoutPage(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedPage = index;
    });
    _pageController.animateToPage(_selectedPage,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        // scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          setState(() {
            _selectedPage = value;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: _onTap,
        menus: [
          BottomNavItem(
            icon: Icons.home,
            label: 'Home',
            isActive: _selectedPage == 0,
          ),
          BottomNavItem(
            icon: Icons.bookmark,
            label: 'Saved',
            isActive: _selectedPage == 1,
          ),
          BottomNavItem(
            icon: Icons.person,
            label: 'Profile',
            isActive: _selectedPage == 2,
          ),
        ],
      ),
    );
  }
}
