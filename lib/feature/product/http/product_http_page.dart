import 'package:flutter/material.dart';
import 'package:flutter_fundamental/core/data/entity/product_model.dart';
import 'package:flutter_fundamental/core/data/remote/http/http_product_repository.dart';

class ProductHttpPage extends StatefulWidget {
  const ProductHttpPage({super.key});

  @override
  State<ProductHttpPage> createState() => _ProductHttpPageState();
}

class _ProductHttpPageState extends State<ProductHttpPage> {
  late Future<List<ProductModel>> products;
  @override
  void initState() {
    products = HttpProductRepository.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Http Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: products,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemBuilder: (context, index) => Card(
                      color: Colors.blue.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                                snapshot.data?[index].thumbnail ?? ""),
                            Text(
                              snapshot.data?[index].title ?? "-",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                                "\$ ${snapshot.data?[index].price.toString() ?? "-"}"),
                          ],
                        ),
                      ),
                    ),
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.7,
                            crossAxisCount: 2),
                  );
                }

                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
