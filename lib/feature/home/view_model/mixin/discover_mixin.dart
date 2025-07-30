import 'package:architecture_template/feature/home/view/discover_view.dart';
import 'package:architecture_template/feature/home/view_model/discover_view_model.dart';
import 'package:architecture_template/product/service/interface/movie_operation.dart';
import 'package:architecture_template/product/service/manager/product_network_error_manager.dart';
import 'package:architecture_template/product/service/movie_service.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

mixin DiscoverMixin on BaseState<DiscoverView> {
  late final PageController _scrollController;
  late final DiscoverViewModel _discoverViewModel;
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final MovieOperation _movieOperationService;

  DiscoverViewModel get discoverViewModel => _discoverViewModel;

  PageController get scrollController => _scrollController;
  @override
  void initState() {
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );
    _scrollController = PageController();
    _discoverViewModel = DiscoverViewModel();
    _movieOperationService =
        MovieService(networkManager: productNetworkManager);
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await fetchMovies();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void loadMore(int index) async {
    if (_discoverViewModel.state.movies != null &&
        index == _discoverViewModel.state.movies!.length - 1) {
      _discoverViewModel.increaseCurrentPage();
      _discoverViewModel.changeLoading(isLoading: true);
      await fetchMovies(page: _discoverViewModel.state.currentPage);
      _discoverViewModel.changeLoading();
    }
  }

  Future<void> fetchMovies({int page = 1}) async {
    _discoverViewModel.changeLoading(isLoading: true);
    final movies = await _movieOperationService.getList(page);

    if (page == 1) {
      _discoverViewModel.addFirstTimeMovieToList(movies);
    } else {
      _discoverViewModel.addMovieToList(movies);
    }
    _discoverViewModel.changeLoading();
  }

  Future<void> setFavorite(Movie movie) async {
    final response =
        await _movieOperationService.removeFavoriteMovieById(movie.id!);
    final tempMovie =
        movie.copyWith(isFavorite: response.data?.movie?.isFavorite ?? false);
    _discoverViewModel.updateMovie(
      tempMovie,
    );
  }
}
