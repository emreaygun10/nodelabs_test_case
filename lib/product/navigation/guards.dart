import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:auto_route/auto_route.dart';
import 'package:kartal/kartal.dart';

final class AuthGuard extends AutoRouteGuard {
  static AuthGuard get instance => AuthGuard();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final userCache = ProductStateItems.productCache.userCacheOperation;
    final users = userCache.getAll();

    if (users.isNotEmpty) {
      final user = users.first;
      if (user.user.token != null && user.user.token!.ext.isNotNullOrNoEmpty) {
        resolver.next();
        return;
      }
    }

    router.pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
  }
}

final class GuestGuard extends AutoRouteGuard {
  static GuestGuard get instance => GuestGuard();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final userCache = ProductStateItems.productCache.userCacheOperation;
    final users = userCache.getAll();
    if (users.isNotEmpty) {
      final user = users.first;
      //TODO Check if user is logged in and has valid token
      if (user.user.token != null && user.user.token!.ext.isNotNullOrNoEmpty) {
        router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
        return;
      }
    }
    resolver.next();
  }
}
