import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/news/view/news_page.dart';
import 'package:flutter_fundamental/feature/responsive/responsive.dart';
import 'package:flutter_fundamental/feature/todo/todo_page.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/animation');
            },
            child: const Text('Go to Animation'),
          ),
          SizedBox(height: 16),
          // OutlinedButton(
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => const Responsive(),
          //     ));
          //   },
          //   child: const Text('Go to Responsive'),
          // ),
          // const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NewsPage(),
              ));
            },
            child: const Text('Go to News'),
          ),
          // const SizedBox(height: 16),
          // OutlinedButton(
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => const Todopage(),
          //     ));
          //   },
          //   child: const Text('Go to Todo'),
          // ),
          // const SizedBox(height: 16),
          // GestureDetector(
          //   onTap: () {
          //     log('Tapped');
          //   },
          //   onDoubleTap: () {
          //     log('Double tapped');
          //   },
          //   onLongPress: () {
          //     log('Long Press');
          //   },
          //   child: const Text('Gesture Detector'),
          // ),
          // const SizedBox(height: 16),
          // InkWell(
          //   onTap: () {
          //     log('InkWell Tapped');
          //   },
          //   onDoubleTap: () {
          //     log('Double tapped');
          //   },
          //   onLongPress: () {
          //     log('Long Press');
          //   },
          //   child: Text('InkWell'),
          // ),
          // const SizedBox(height: 16),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.blue,
          //   ),
          //   onPressed: () {},
          //   child: const Text(
          //     'Elevated Button',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          // TextButton(
          //   onPressed: () {},
          //   child: const Text('Text Button'),
          // ),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
          // const SizedBox(
          //   height: 30,
          // ),
          // const Text(
          //   'Saved Page',
          //   style: TextStyle(color: Colors.blue),
          // ),
          // OutlinedButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/input');
          //   },
          //   style: const ButtonStyle(visualDensity: VisualDensity.compact),
          //   child: const Text('Input & Form'),
          // ),
          // OutlinedButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/notification');
          //   },
          //   style: const ButtonStyle(visualDensity: VisualDensity.compact),
          //   child: const Text('Notification & Confirmation'),
          // ),
          // OutlinedButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/picker');
          //   },
          //   style: const ButtonStyle(visualDensity: VisualDensity.compact),
          //   child: const Text('Picker Widget'),
          // ),
        ],
      ),
    );
  }
}
