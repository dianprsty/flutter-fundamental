import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/core/data/local/objectbox/objectbox.dart';
import 'package:flutter_fundamental/core/data/remote/auth_repository.dart';
import 'package:flutter_fundamental/core/data/remote/remote_data_source.dart';
import 'package:flutter_fundamental/core/route/route.dart';
import 'package:flutter_fundamental/feature/auth/bloc/auth_bloc.dart';
import 'package:flutter_fundamental/feature/news/bloc/news_bloc.dart';
import 'package:flutter_fundamental/feature/news/repository/news_data_provider.dart';
import 'package:flutter_fundamental/feature/news/repository/news_repository.dart';
import 'package:flutter_fundamental/feature/news_api/bloc/news_api_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

late ObjectBox objectbox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final User? firebaseUser = FirebaseAuth.instance.currentUser;
  objectbox = await ObjectBox.create();
  runApp(MyApp(
    newsRepository: NewsRepository(
      newsDataProvider: NewsDataProvider(objectbox: objectbox),
    ),
    user: firebaseUser,
  ));
}

class MyApp extends StatelessWidget {
  final NewsRepository newsRepository;

  final User? user;
  const MyApp({super.key, required this.newsRepository, required this.user});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NewsBloc>(
            create: (_) => NewsBloc(
                newsRepository: NewsRepository(
                    newsDataProvider: NewsDataProvider(objectbox: objectbox)))
              ..add(GetNews()),
          ),
          BlocProvider<NewsApiBloc>(
            create: (_) => NewsApiBloc(
              remoteDataSource: RemoteDataSource(),
            )..add(LoadNews()),
          ),
          BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(
              authRepository: AuthRepository(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter News',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          initialRoute: user == null ? '/' : '/login',
          routes: appRoutes,
        ));
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Aplikasi dasar flutter"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print("setting");
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              print("setting");
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        tooltip: 'Increment', label: const Text('Tambah'),
        // child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
