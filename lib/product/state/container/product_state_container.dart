import 'package:architecture_template/product/cache/product_cache.dart';
import 'package:architecture_template/product/service/manager/product_network_manager.dart';
import 'package:architecture_template/product/state/view_model/product_view_model.dart';
import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

final class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;

  /// use singleton pattern setup
  static void setup() {
    _getIt
      ..registerSingleton(ProductCache(cacheManager: HiveCacheManager()))
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base())
      ..registerLazySingleton<ProductViewModel>(ProductViewModel.new);
  }

  /// Read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
