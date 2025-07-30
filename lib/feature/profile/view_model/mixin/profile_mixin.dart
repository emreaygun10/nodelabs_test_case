import 'package:architecture_template/feature/profile/view/profile_view.dart';
import 'package:architecture_template/feature/profile/view_model/profile_view_model.dart';
import 'package:architecture_template/product/cache/models/user_cache_model.dart';
import 'package:architecture_template/product/service/interface/movie_operation.dart';
import 'package:architecture_template/product/service/manager/product_network_error_manager.dart';
import 'package:architecture_template/product/service/movie_service.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:core/core.dart';

mixin ProfileMixin on BaseState<ProfileView> {
  late final ProfileViewModel _profileViewModel;
  late final MovieOperation _movieOperationService;
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  /// Profile Detail view model getter
  ProfileViewModel get profileViewModel => _profileViewModel;

  ///Get User from cache
  HiveCacheOperation<UserCacheModel> get userCache =>
      ProductStateItems.productCache.userCacheOperation;
  @override
  void initState() {
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );
    _profileViewModel = ProfileViewModel();
    _movieOperationService =
        MovieService(networkManager: productNetworkManager);
    getUserInfo();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getFavoriteMovies();
  }

  void getFavoriteMovies() async {
    _profileViewModel.changeLoading(isLoading: true);
    final movies = await _movieOperationService.favorites();
    _profileViewModel
      ..setFavoriteList(movies)
      ..changeLoading();
  }

  void getUserInfo() {
    final user = userCache.getAll().first;
    _profileViewModel.setUserInfo(user.user);
  }
}
