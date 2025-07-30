import 'package:architecture_template/product/cache/product_cache.dart';
import 'package:architecture_template/product/service/manager/product_network_manager.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:architecture_template/product/state/view_model/product_view_model.dart';
import 'package:flutter/widgets.dart';

/// Product Base state
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  /// ProductNetwork Manager getter
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  /// ProductViewModel getter
  ProductViewModel get productViewModel => ProductStateItems.productViewModel;

  /// ProductCache getter
  ProductCache get productCache => ProductStateItems.productCache;
}
