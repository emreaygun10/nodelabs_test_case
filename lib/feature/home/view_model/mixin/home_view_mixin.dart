import 'package:architecture_template/feature/home/view/discover_view.dart';
import 'package:architecture_template/feature/home/view/home_view.dart';
import 'package:architecture_template/feature/home/view_model/home_view_model.dart';
import 'package:architecture_template/feature/profile/view/profile_view.dart';
import 'package:architecture_template/product/service/manager/product_network_error_manager.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:flutter/material.dart';

mixin HomeViewMixin on BaseState<HomeView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final HomeViewModel _homeViewModel;
  late final List<Widget> _pages;

  /// HomeView Model getter
  HomeViewModel get homeViewMode => _homeViewModel;
  final GlobalKey<State> _myPageKey = GlobalKey();
  List<Widget> get pages => _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const DiscoverView(
        key: Key('discover'),
      ),
      ProfileView(
        key: _myPageKey,
      ),
    ];
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    _homeViewModel = HomeViewModel();
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );
  }

  void changeIndex(int index) {
    productViewModel.changeIndex(index);
    if (index == 1) {
      _myPageKey.currentState?.didChangeDependencies();
    }
  }
}
