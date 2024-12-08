import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/product/dio/product_dio_page.dart';
import 'package:flutter_fundamental/feature/product/http/product_http_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProductHttpPage(),
                ));
              },
              child: const Text('Http'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProductDioPage(),
                ));
              },
              child: const Text('Dio'),
            ),
          ],
        ),
      ),
    );
  }
}
