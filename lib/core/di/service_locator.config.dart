// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:oolio_fe_challenge/core/di/injection_modules.dart' as _i430;
import 'package:oolio_fe_challenge/core/navigation/navigation_analytics.dart'
    as _i1042;
import 'package:oolio_fe_challenge/core/navigation/navigation_error_handler.dart'
    as _i836;
import 'package:oolio_fe_challenge/core/navigation/navigation_middleware.dart'
    as _i968;
import 'package:oolio_fe_challenge/core/navigation/navigation_service.dart'
    as _i930;
import 'package:oolio_fe_challenge/core/storage/local_storage_service.dart'
    as _i913;
import 'package:oolio_fe_challenge/core/storage/storage_service.dart' as _i583;
import 'package:oolio_fe_challenge/core/storage/sync_queue_manager.dart'
    as _i129;
import 'package:oolio_fe_challenge/features/cart/data/repositories/cart_repository_impl.dart'
    as _i990;
import 'package:oolio_fe_challenge/features/cart/domain/repositories/cart_repository.dart'
    as _i1014;
import 'package:oolio_fe_challenge/features/cart/presentation/cubit/cart_cubit.dart'
    as _i1035;
import 'package:oolio_fe_challenge/features/orders/data/repositories/order_repository_impl.dart'
    as _i423;
import 'package:oolio_fe_challenge/features/orders/domain/repositories/order_repository.dart'
    as _i47;
import 'package:oolio_fe_challenge/features/orders/presentation/cubit/checkout_cubit.dart'
    as _i1064;
import 'package:oolio_fe_challenge/features/orders/presentation/cubit/order_cubit.dart'
    as _i864;
import 'package:oolio_fe_challenge/features/orders/presentation/cubit/order_tracking_cubit.dart'
    as _i354;
import 'package:oolio_fe_challenge/features/printing/data/repositories/print_queue_repository_impl.dart'
    as _i417;
import 'package:oolio_fe_challenge/features/printing/domain/models/print_job_manager.dart'
    as _i775;
import 'package:oolio_fe_challenge/features/printing/domain/repositories/print_queue_repository.dart'
    as _i891;
import 'package:oolio_fe_challenge/features/printing/domain/services/print_service.dart'
    as _i628;
import 'package:oolio_fe_challenge/features/printing/presentation/cubit/print_queue_cubit.dart'
    as _i1037;
import 'package:oolio_fe_challenge/features/products/data/repositories/product_repository_impl.dart'
    as _i715;
import 'package:oolio_fe_challenge/features/products/domain/repositories/product_repository.dart'
    as _i857;
import 'package:oolio_fe_challenge/features/products/presentation/cubit/product_cubit.dart'
    as _i1040;
import 'package:oolio_fe_challenge/features/products/presentation/cubit/product_detail_cubit.dart'
    as _i752;
import 'package:oolio_fe_challenge/features/sync/presentation/cubit/sync_cubit.dart'
    as _i886;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    gh.factory<_i752.ProductDetailCubit>(() => _i752.ProductDetailCubit());
    gh.singleton<_i583.StorageService>(() => storageModule.storageService);
    gh.singleton<_i930.NavigationService>(() => _i930.NavigationService());
    gh.singleton<_i836.NavigationErrorHandler>(
        () => _i836.NavigationErrorHandler());
    gh.singleton<_i913.LocalStorageService>(() => _i913.LocalStorageService());
    gh.lazySingleton<_i47.OrderRepository>(
        () => _i423.OrderRepositoryImpl(gh<_i583.StorageService>()));
    gh.singleton<_i1042.NavigationAnalytics>(
        () => _i1042.NavigationAnalytics(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i1014.CartRepository>(
        () => _i990.CartRepositoryImpl(gh<_i583.StorageService>()));
    gh.singleton<_i891.PrintQueueRepository>(
        () => _i417.PrintQueueRepositoryImpl());
    gh.singleton<_i129.SyncQueueManager>(
        () => _i129.SyncQueueManager(gh<_i583.StorageService>()));
    gh.singleton<_i968.NavigationMiddleware>(
        () => _i968.NavigationMiddleware(gh<_i1042.NavigationAnalytics>()));
    gh.factory<_i864.OrderCubit>(
        () => _i864.OrderCubit(gh<_i47.OrderRepository>()));
    gh.factory<_i354.OrderTrackingCubit>(
        () => _i354.OrderTrackingCubit(gh<_i47.OrderRepository>()));
    gh.lazySingleton<_i857.ProductRepository>(
        () => _i715.ProductRepositoryImpl(gh<_i583.StorageService>()));
    gh.singleton<_i775.PrintJobManager>(
        () => _i775.PrintJobManager(gh<_i891.PrintQueueRepository>()));
    gh.singleton<_i628.PrintService>(
        () => _i628.PrintService(gh<_i891.PrintQueueRepository>()));
    gh.factory<_i1040.ProductCubit>(
        () => _i1040.ProductCubit(gh<_i857.ProductRepository>()));
    gh.factory<_i886.SyncCubit>(
        () => _i886.SyncCubit(gh<_i129.SyncQueueManager>()));
    gh.factory<_i1037.PrintQueueCubit>(() => _i1037.PrintQueueCubit(
          gh<_i891.PrintQueueRepository>(),
          gh<_i775.PrintJobManager>(),
        ));
    gh.factory<_i1035.CartCubit>(
        () => _i1035.CartCubit(gh<_i1014.CartRepository>()));
    gh.factory<_i1064.CheckoutCubit>(() => _i1064.CheckoutCubit(
          gh<_i47.OrderRepository>(),
          gh<_i1014.CartRepository>(),
          gh<_i628.PrintService>(),
          gh<_i775.PrintJobManager>(),
        ));
    return this;
  }
}

class _$StorageModule extends _i430.StorageModule {}
