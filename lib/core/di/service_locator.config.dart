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
    gh.singleton<_i913.LocalStorageService>(() => _i913.LocalStorageService());
    gh.singleton<_i583.StorageService>(() => storageModule.storageService);
    gh.lazySingleton<_i1014.CartRepository>(
        () => _i990.CartRepositoryImpl(gh<_i583.StorageService>()));
    gh.singleton<_i129.SyncQueueManager>(
        () => _i129.SyncQueueManager(gh<_i583.StorageService>()));
    gh.lazySingleton<_i857.ProductRepository>(
        () => _i715.ProductRepositoryImpl(gh<_i583.StorageService>()));
    gh.factory<_i1040.ProductCubit>(
        () => _i1040.ProductCubit(gh<_i857.ProductRepository>()));
    gh.factory<_i886.SyncCubit>(
        () => _i886.SyncCubit(gh<_i129.SyncQueueManager>()));
    gh.factory<_i1035.CartCubit>(
        () => _i1035.CartCubit(gh<_i1014.CartRepository>()));
    return this;
  }
}

class _$StorageModule extends _i430.StorageModule {}
