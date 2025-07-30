import 'package:architecture_template/product/cache/product_cache.dart';
import 'package:architecture_template/product/service/manager/product_network_manager.dart';
import 'package:architecture_template/product/state/container/product_state_container.dart';
import 'package:architecture_template/product/state/view_model/product_view_model.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();

  static ProductCache get productCache => ProductContainer.read<ProductCache>();
}
