import 'package:architecture_template/feature/auth/login/login_view.dart';
import 'package:architecture_template/feature/auth/profile_detail/profile_detail_view.dart';
import 'package:architecture_template/feature/auth/register/register_view.dart';
import 'package:architecture_template/feature/home/view/discover_view.dart';
import 'package:architecture_template/feature/home/view/home_view.dart';
import 'package:architecture_template/feature/profile/view/profile_view.dart';
import 'package:architecture_template/product/navigation/guards.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)
final class AppRouter extends _$AppRouter {
  static const _replaceRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          guards: [AuthGuard.instance],
        ),
        AutoRoute(
          page: ProfileRoute.page,
          guards: [AuthGuard.instance],
        ),
        AutoRoute(
          page: DiscoverRoute.page,
          guards: [AuthGuard.instance],
        ),
        AutoRoute(
          page: ProfileDetailRoute.page,
          guards: [AuthGuard.instance],
        ),
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
          guards: [GuestGuard.instance],
        ),
        AutoRoute(
          page: RegisterRoute.page,
          guards: [GuestGuard.instance],
        ),
      ];
}
