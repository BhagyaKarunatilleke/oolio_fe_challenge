import 'package:flutter/material.dart';
import 'core/di/service_locator.dart';
import 'core/di/app_bloc_provider.dart';
import 'features/products/presentation/pages/product_catalog_page.dart';

// Global navigator key for navigation from anywhere in the app
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
        navigatorKey: navigatorKey,
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
