import 'package:flutter/material.dart';
import 'di.dart';
import 'features/all_products/presentation/pages/all_products.dart';
import 'features/all_products/presentation/pages/favorite_products.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AllProductsPage(),
        '/favorites': (context) => const FavoriteProductsPage(),
      },
    );
  }
}
