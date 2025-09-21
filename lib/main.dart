import 'package:flutter/material.dart';
import 'core/di/service_locator.dart';
import 'core/di/app_bloc_provider.dart';
import 'features/products/presentation/pages/product_catalog_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      child: MaterialApp(
        title: 'POS System - Food Truck',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const ProductCatalogPage(),
      ),
    );
  }
}
