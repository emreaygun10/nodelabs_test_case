part of 'product_cache.dart';

/// The `init` function initializes a cache manager with an
/// empty [UserCacheModel].
Future<void> _init(CacheManager cacheManager) async {
  await cacheManager.init(
    items: [
      UserCacheModel.empty(),
    ],
  );
}

/// The `_remove` function takes a `CacheManager` instance and calls its
/// `remove` method.
///
/// Args:
///   cacheManager (CacheManager): The `cacheManager` parameter is an object of
/// type `CacheManager` that
/// is passed to the `_remove` function.
void _remove(CacheManager cacheManager) {
  cacheManager.remove();
}
