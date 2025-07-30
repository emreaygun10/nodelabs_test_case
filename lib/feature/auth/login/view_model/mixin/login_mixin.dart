import 'package:architecture_template/feature/auth/login/login_view.dart';
import 'package:architecture_template/feature/auth/login/view_model/login_view_model.dart';
import 'package:architecture_template/product/cache/models/user_cache_model.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:architecture_template/product/service/interface/login_operation.dart';
import 'package:architecture_template/product/service/login_service.dart';
import 'package:architecture_template/product/service/manager/models/login_model.dart';
import 'package:architecture_template/product/service/manager/product_network_error_manager.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

/// Login Mixin Class
mixin LoginViewMixin on BaseState<LoginView> {
  late final LoginViewModel _loginViewModel;
  late final LoginOperation _loginOperationService;
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  final GlobalKey<FormState> formKey = GlobalKey();

  /// Email Text field editing controller
  final TextEditingController emailTextEditingController =
      TextEditingController();

  /// Password text field editing controller
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  /// Login view model getter
  LoginViewModel get loginViewModel => _loginViewModel;

  HiveCacheOperation<UserCacheModel> get userCache =>
      ProductStateItems.productCache.userCacheOperation;
  @override
  void initState() {
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );
    _loginViewModel = LoginViewModel();
    _loginOperationService =
        LoginService(networkManager: productNetworkManager);
    super.initState();
  }

  /// User login operation
  Future<void> login() async {
    loginViewModel.changeLoading(isLoading: true);
    final router = context.router;
    final response = await _loginOperationService.login(
      LoginModel(
        email: loginViewModel.state.email ?? '',
        password: loginViewModel.state.password ?? '',
      ),
    );
    if (response.data != null &&
        response.data!.token != null &&
        response.data!.token!.ext.isNotNullOrNoEmpty) {
      saveUser(response.data);

      loginViewModel.changeLoading();
      if (mounted) {
        await router.pushAndPopUntil(
          const ProfileDetailRoute(),
          predicate: (route) => false,
        );
      }
    } else {
      if (mounted) {
        await CustomAlertDialog.show(
          title: 'auth.login.error'.tr(),
          showCancel: false,
          confirmText: 'auth.login.ok'.tr(),
          context: context,
        );
      }

      loginViewModel.changeLoading();
    }
  }

  /// Set password
  void setPassword(String? password) {
    if (password.ext.isNotNullOrNoEmpty) {
      loginViewModel.setPassword(password);
    }
  }

  /// Set mail
  void setEmail(String? mail) {
    if (mail.ext.isNotNullOrNoEmpty) {
      loginViewModel.setEmail(mail);
    }
  }

  /// Change obscure text field
  void changeObscure() {
    loginViewModel.changeObscure();
  }

  void saveUser(User? user) {
    if (user != null) {
      print(user.toJson());
      final tempUser = UserCacheModel(user: user);
      removeUser(tempUser);
      userCache.add(tempUser);
    }
  }

  void removeUser(UserCacheModel user) {
    userCache.removeAll();
  }
}
