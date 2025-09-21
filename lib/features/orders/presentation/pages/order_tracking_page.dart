import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/order_tracking_cubit.dart';
import '../cubit/order_tracking_state.dart';
import '../widgets/order_list_widget.dart';
import '../widgets/order_filter_widget.dart';
import '../widgets/order_search_widget.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({super.key});

  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  @override
  void initState() {
    super.initState();
    // Refresh orders when the page is first opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderTrackingCubit>().loadOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const OrderTrackingView();
  }
}

class OrderTrackingView extends StatefulWidget {
  const OrderTrackingView({super.key});

  @override
  State<OrderTrackingView> createState() => _OrderTrackingViewState();
}

class _OrderTrackingViewState extends State<OrderTrackingView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Management'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.assignment_outlined), text: 'Active Orders'),
            Tab(icon: Icon(Icons.history), text: 'Order History'),
          ],
        ),
      ),
      body: BlocBuilder<OrderTrackingCubit, OrderTrackingState>(
        builder: (context, state) {
          return Column(
            children: [
              // Search and Filter Section
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    OrderSearchWidget(
                      onSearchChanged: (query) {
                        context.read<OrderTrackingCubit>().setSearchQuery(
                          query,
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    OrderFilterWidget(
                      onFilterChanged: (filter) {
                        context.read<OrderTrackingCubit>().setFilter(filter);
                      },
                    ),
                  ],
                ),
              ),
              // Orders Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Active Orders Tab
                    _buildOrdersContent(state, isActiveOrders: true),
                    // Order History Tab
                    _buildOrdersContent(state, isActiveOrders: false),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<OrderTrackingCubit>().loadOrders();
        },
        tooltip: 'Refresh Orders',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildOrdersContent(
    OrderTrackingState state, {
    required bool isActiveOrders,
  }) {
    return state.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (activeOrders, completedOrders, currentFilter, searchQuery) {
        final orders = isActiveOrders ? activeOrders : completedOrders;

        if (orders.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isActiveOrders ? Icons.assignment_outlined : Icons.history,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  isActiveOrders ? 'No active orders' : 'No order history',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Text(
                  isActiveOrders
                      ? 'New orders will appear here'
                      : 'Completed orders will appear here',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
                ),
              ],
            ),
          );
        }

        return OrderListWidget(orders: orders, isActiveOrders: isActiveOrders);
      },
      error: (message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error loading orders',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.red),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<OrderTrackingCubit>().loadOrders();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
