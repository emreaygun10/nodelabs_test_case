import 'package:architecture_template/product/cache/models/user_cache_model.dart';
import 'package:core/core.dart';

part 'product_cache_operation.dart';

///
class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  /// The `setup` function initializes a product cache operation asynchronously.
  Future<void> setup() async {
    await _init(_cacheManager);
  }

  /// The `remove` function calls the `_remove` function with the
  /// `_cacheManager` parameter.
  void remove() {
    _remove(_cacheManager);
  }

  /// The line `late final HiveCacheOperation<UserCacheModel> userCacheOperation =
  /// HiveCacheOperation<UserCacheModel>();` is declaring a late-initialized
  /// final variable `userCacheOperation` of type
  /// `HiveCacheOperation<UserCacheModel>`.
  late final HiveCacheOperation<UserCacheModel> userCacheOperation =
      HiveCacheOperation<UserCacheModel>();
}
