import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/products/presentation/cubit/product_cubit.dart';
import '../../features/products/presentation/cubit/product_detail_cubit.dart';
import '../../features/sync/presentation/cubit/sync_cubit.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import 'service_locator.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;

  const AppBlocProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(create: (context) => get<ProductCubit>()),
        BlocProvider<ProductDetailCubit>(
          create: (context) => get<ProductDetailCubit>(),
        ),
        BlocProvider<SyncCubit>(create: (context) => get<SyncCubit>()),
        BlocProvider<CartCubit>(create: (context) => get<CartCubit>()),
      ],
      child: child,
    );
  }
}
