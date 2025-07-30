
import 'package:core/src/cache/core/cache_model.dart';

///The CacheManager class is an abstract class.
abstract class CacheManager{
  /// Cache Manager 
  CacheManager({this.path});
/// Make your cache initialization here.
  Future<void> init({required List<CacheModel> items});
  /// Remove all box in memory
  void remove();

/// [path] is the path to the directory for example testing
  final String? path;

}