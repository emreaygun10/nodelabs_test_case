import 'package:architecture_template/feature/auth/register/register_view.dart';
import 'package:architecture_template/feature/auth/register/view_model/register_view_model.dart';
import 'package:architecture_template/product/cache/models/user_cache_model.dart';
import 'package:architecture_template/product/service/interface/register_operation.dart';
import 'package:architecture_template/product/service/manager/models/sign_up_model.dart';
import 'package:architecture_template/product/service/manager/product_network_error_manager.dart';
import 'package:architecture_template/product/service/register_service.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

mixin RegisterMixin on BaseState<RegisterView> {
  late final RegisterViewModel _registerViewModel;
  late final RegisterOperation _registerOperationService;
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  final GlobalKey<FormState> formKey = GlobalKey();

  /// Email Text field editing controller
  final TextEditingController passwordConfirmController =
      TextEditingController();

  /// Password text field editing controller
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  /// Register view model getter
  RegisterViewModel get registerViewModel => _registerViewModel;

  HiveCacheOperation<UserCacheModel> get userCache =>
      ProductStateItems.productCache.userCacheOperation;
  @override
  void initState() {
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );
    _registerViewModel = RegisterViewModel();
    _registerOperationService =
        RegisterService(networkManager: productNetworkManager);
    super.initState();
  }

  Future<void> register() async {
    {
      if (passwordTextEditingController.text ==
          passwordConfirmController.text) {
        registerViewModel.changeLoading(isLoading: true);
        final response = await _registerOperationService.register(
          SignUpModel(
            name: registerViewModel.state.username ?? '',
            email: registerViewModel.state.email ?? '',
            password: registerViewModel.state.password ?? '',
          ),
        );
        if (response.data != null &&
            response.data!.token != null &&
            response.data!.token!.ext.isNotNullOrNoEmpty) {
          saveUser(response.data);
          print(userCache.get(response.data!.id!)!.user.token);
          registerViewModel.changeLoading();
        } else {
          registerViewModel.changeLoading();
        }
      }
    }
  }

  void saveUser(User? user) {
    if (user != null) {
      final tempUser = UserCacheModel(user: user);
      removeUser(tempUser);
      userCache.add(tempUser);
    }
  }

  void removeUser(UserCacheModel user) {
    userCache.removeAll();
  }

  void setEmail(String? email) {
    _registerViewModel.setEmail(email);
  }

  void setUserName(String? username) {
    _registerViewModel.setUsername(username);
  }

  void setPassword(String? password) {
    _registerViewModel.setPassword(password);
  }

  void changeObscure() {
    _registerViewModel.changeObscure();
  }
}
