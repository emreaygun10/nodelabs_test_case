import 'dart:io';

import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

/// Manage your network error with screen
final class ProductNetworkErrorManager {
  ProductNetworkErrorManager(this.context);
  final BuildContext context;

  void handleError(int value) {
    if (value == HttpStatus.unauthorized) {
      context.router.pushAndPopUntil(
        const LoginRoute(),
        predicate: (route) => false,
      );
    }
  }
}
