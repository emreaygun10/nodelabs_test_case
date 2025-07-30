import 'dart:io';

import 'package:architecture_template/feature/auth/profile_detail/profile_detail_view.dart';
import 'package:architecture_template/feature/auth/profile_detail/view_model/profile_detail_view_model.dart';
import 'package:architecture_template/product/cache/models/user_cache_model.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:architecture_template/product/service/file_service.dart';
import 'package:architecture_template/product/service/interface/file_operation.dart';
import 'package:architecture_template/product/service/manager/product_network_error_manager.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vexana/vexana.dart';
import 'package:widgets/widgets.dart';

mixin ProfileDetailMixin on BaseState<ProfileDetailView> {
  late final ProfileDetailViewModel _profileDetailViewModel;
  late final FileOperation _fileOperationService;
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  /// Register view model getter
  ProfileDetailViewModel get profileDetailViewModel => _profileDetailViewModel;

  HiveCacheOperation<UserCacheModel> get userCache =>
      ProductStateItems.productCache.userCacheOperation;
  @override
  void initState() {
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );
    _profileDetailViewModel = ProfileDetailViewModel();
    _fileOperationService = FileService(networkManager: productNetworkManager);
    super.initState();
  }

  Future<void> uploadPhotoForUser() async {
    if (_profileDetailViewModel.state.file == null) {
      if (context.mounted) {
        await CustomAlertDialog.show(
          title: 'auth.profile.error'.tr(),
          context: context,
          showCancel: false,
          confirmText: 'auth.login.ok'.tr(),
        );
      }
      return;
    }
    final multiPartFile = await MultipartFile.fromFile(
      _profileDetailViewModel.state.file!.path,
      filename: 'Default_photo.jpg',
    );
    final formData = FormData.fromMap({
      'file': multiPartFile,
    });
    final res =
        await _fileOperationService.uploadPhoto(formData).catchError((e) {
      if (context.mounted) {
        CustomAlertDialog.show(
            title: 'auth.profile.maxSize'.tr(),
            context: context,
            showCancel: false,
            confirmText: 'auth.login.ok'.tr());
      }
    });
    if (res.photoUrl != null) {
      final user = userCache.getAll().first.copyWith(
            user: userCache.getAll().first.user.copyWith(
                  photoUrl: res.photoUrl,
                ),
          );
      userCache
        ..remove(user.id)
        ..add(user);
    }
    if (context.mounted) {
      await context.router.pushAndPopUntil(
        const HomeRoute(),
        predicate: (route) => false,
      );
    }
  }

  void setPhoto(File file) {
    _profileDetailViewModel.setFile(file);
  }
}
