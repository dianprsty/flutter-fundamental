import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/responsive/responsive_demo_page.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResponsiveDemoPage()));
            },
            icon: const Icon(Icons.chevron_right),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  color: Colors.blue.shade200,
                  child: const Text('Width: 200'),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) => Container(
                      height: 200,
                      color: Colors.red.shade300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Width Media Query: ${MediaQuery.of(context).size.width}'),
                          Text('Width LayoutBuilder: ${constraints.maxWidth}'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    color: Colors.purple.shade300,
                    child: Center(
                        child: Text(
                            'Media Query Width: ${MediaQuery.of(context).size.width}')),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      alignment: Alignment.center,
                      width: constraints.maxWidth,
                      height: 200,
                      color: Colors.green.shade300,
                      child: Text(
                          'Laiyout Builder Width: ${constraints.maxWidth}'),
                    );
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
