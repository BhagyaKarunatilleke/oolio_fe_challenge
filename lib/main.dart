import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/storage/local_storage_service.dart';
import 'core/storage/sync_queue_manager.dart';
import 'features/sync/presentation/cubit/sync_cubit.dart';
import 'features/products/presentation/cubit/product_cubit.dart';
import 'features/products/data/repositories/product_repository_impl.dart';
import 'features/products/presentation/pages/product_catalog_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage and sync services
  await LocalStorageService.instance.initialize();
  await SyncQueueManager.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SyncCubit>(create: (context) => SyncCubit()),
        BlocProvider<ProductCubit>(
          create: (context) =>
              ProductCubit(ProductRepositoryImpl(LocalStorageService.instance)),
        ),
      ],
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
