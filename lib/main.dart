import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/storage/local_storage_service.dart';
import 'core/storage/sync_queue_manager.dart';
import 'features/sync/presentation/cubit/sync_cubit.dart';

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
      providers: [BlocProvider<SyncCubit>(create: (context) => SyncCubit())],
      child: MaterialApp(
        title: 'POS System - Food Truck',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const POSHomePage(),
      ),
    );
  }
}

class POSHomePage extends StatelessWidget {
  const POSHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POS System - Food Truck'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          BlocBuilder<SyncCubit, SyncState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state is SyncOnlineStatusChanged && state.isOnline
                      ? Icons.wifi
                      : Icons.wifi_off,
                ),
                onPressed: () {
                  final cubit = context.read<SyncCubit>();
                  if (state is SyncOnlineStatusChanged) {
                    cubit.setOnlineStatus(!state.isOnline);
                  } else {
                    cubit.setOnlineStatus(true);
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task 2.1: Offline-First Data Layer',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            const Text(
              'Implementation Status: ✅ Complete',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Features Implemented:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const FeatureItem(
              icon: Icons.storage,
              title: 'Local Storage Service',
              description: 'Hive-based storage with CRUD operations',
            ),
            const FeatureItem(
              icon: Icons.sync,
              title: 'Sync Queue Manager',
              description: 'Offline queuing with automatic retry logic',
            ),
            const FeatureItem(
              icon: Icons.data_object,
              title: 'Data Models',
              description:
                  'Product, Order, and Sync models with Hive integration',
            ),
            const FeatureItem(
              icon: Icons.psychology,
              title: 'State Management',
              description: 'Cubit-based state management for sync operations',
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<SyncCubit>().triggerSync();
                    },
                    icon: const Icon(Icons.sync),
                    label: const Text('Trigger Sync'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<SyncCubit>().getQueueStats();
                    },
                    icon: const Icon(Icons.analytics),
                    label: const Text('Queue Stats'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BlocBuilder<SyncCubit, SyncState>(
              builder: (context, state) {
                if (state is SyncStatsLoaded) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sync Queue Statistics:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text('Total Items: ${state.stats.totalItems}'),
                          Text('Pending: ${state.stats.pendingItems}'),
                          Text('Failed: ${state.stats.failedItems}'),
                          Text('Syncing: ${state.stats.syncingItems}'),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
