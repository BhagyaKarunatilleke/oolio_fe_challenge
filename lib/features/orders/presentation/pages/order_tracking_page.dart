import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/order_tracking_cubit.dart';
import '../cubit/order_tracking_state.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/order_status.dart';
import '../widgets/order_list_widget.dart';
import '../widgets/order_filter_widget.dart';
import '../widgets/order_search_widget.dart';

class OrderTrackingPage extends StatefulWidget {
  final bool shouldGoToHome;

  const OrderTrackingPage({super.key, this.shouldGoToHome = false});

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
    return OrderTrackingView(shouldGoToHome: widget.shouldGoToHome);
  }
}

class OrderTrackingView extends StatefulWidget {
  final bool shouldGoToHome;

  const OrderTrackingView({super.key, this.shouldGoToHome = false});

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
    return PopScope(
      canPop: !widget.shouldGoToHome,
      onPopInvokedWithResult: (didPop, result) {
        if (widget.shouldGoToHome && !didPop) {
          // If we should go to home and the pop was prevented, navigate to home
          context.go('/');
        }
      },
      child: Scaffold(
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
      ),
    );
  }

  List<OrderModel> _applyFilters(
    List<OrderModel> allOrders,
    OrderTrackingFilter currentFilter,
    String searchQuery,
    bool isActiveOrders,
  ) {
    List<OrderModel> filteredOrders = allOrders;

    // Apply tab-based filtering (Active vs Completed)
    if (isActiveOrders) {
      filteredOrders = filteredOrders
          .where(
            (order) =>
                order.status != OrderStatus.completed &&
                order.status != OrderStatus.cancelled,
          )
          .toList();
    } else {
      filteredOrders = filteredOrders
          .where(
            (order) =>
                order.status == OrderStatus.completed ||
                order.status == OrderStatus.cancelled,
          )
          .toList();
    }

    // Apply status filter
    switch (currentFilter) {
      case OrderTrackingFilter.all:
        // No additional filtering needed
        break;
      case OrderTrackingFilter.pending:
        filteredOrders = filteredOrders
            .where((order) => order.status == OrderStatus.pending)
            .toList();
        break;
      case OrderTrackingFilter.preparing:
        filteredOrders = filteredOrders
            .where((order) => order.status == OrderStatus.preparing)
            .toList();
        break;
      case OrderTrackingFilter.ready:
        filteredOrders = filteredOrders
            .where((order) => order.status == OrderStatus.ready)
            .toList();
        break;
      case OrderTrackingFilter.completed:
        filteredOrders = filteredOrders
            .where((order) => order.status == OrderStatus.completed)
            .toList();
        break;
      case OrderTrackingFilter.cancelled:
        filteredOrders = filteredOrders
            .where((order) => order.status == OrderStatus.cancelled)
            .toList();
        break;
    }

    // Apply search filter
    if (searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      filteredOrders = filteredOrders.where((order) {
        return order.orderNumber.toLowerCase().contains(query) ||
            (order.customerName?.toLowerCase().contains(query) ?? false) ||
            (order.customerPhone?.contains(query) ?? false);
      }).toList();
    }

    // Sort by creation date (newest first)
    filteredOrders.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return filteredOrders;
  }

  Widget _buildOrdersContent(
    OrderTrackingState state, {
    required bool isActiveOrders,
  }) {
    return state.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (activeOrders, completedOrders, currentFilter, searchQuery) {
        // Get all orders and apply filtering
        final allOrders = [...activeOrders, ...completedOrders];
        final orders = _applyFilters(
          allOrders,
          currentFilter,
          searchQuery,
          isActiveOrders,
        );

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
