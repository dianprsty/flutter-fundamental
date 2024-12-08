import 'package:flutter/material.dart';
import 'package:flutter_fundamental/core/data/entity/user_model.dart';
import 'package:flutter_fundamental/core/data/remote/dio/dio_user_repository.dart';

class ProductDioPage extends StatefulWidget {
  const ProductDioPage({super.key});

  @override
  State<ProductDioPage> createState() => _ProductDioPageState();
}

class _ProductDioPageState extends State<ProductDioPage> {
  Future<List<UserModel>>? users;

  @override
  void initState() {
    // final dioRepository = DioUserRepository();
    // users = dioRepository.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Dio Page"),
        backgroundColor: Colors.red.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            users == null
                ? Expanded(child: const Center(child: Text("No User Data")))
                : Expanded(
                    child: FutureBuilder<List<UserModel>>(
                      future: users,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.red.shade100,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        snapshot.data![index].avatar == null
                                            ? null
                                            : NetworkImage(
                                                snapshot.data![index].avatar ??
                                                    "",
                                              ),
                                    child: snapshot.data![index].avatar == null
                                        ? Text(
                                            snapshot.data![index].id.toString())
                                        : null,
                                  ),
                                  title: Text(
                                      snapshot.data![index].firstName ?? "-"),
                                  subtitle:
                                      Text(snapshot.data![index].email ?? "-"),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 8),
                          );
                        } else if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text("Get Users",
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                final dioRepository = DioUserRepository();
                setState(() {
                  users = dioRepository.getUsers();
                });
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
