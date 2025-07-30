import 'dart:ui';

import 'package:architecture_template/feature/home/view_model/discover_view_model.dart';
import 'package:architecture_template/feature/home/view_model/mixin/discover_mixin.dart';
import 'package:architecture_template/feature/home/view_model/state/discover_state.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/widget/product_empty_list_widget.dart';
import 'package:architecture_template/product/widget/product_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends BaseState<DiscoverView> with DiscoverMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => discoverViewModel,
      child: Scaffold(
        body: BlocBuilder<DiscoverViewModel, DiscoverState>(
          builder: (context, state) {
            final movies = state.movies;

            if (movies == null || movies.isEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  await fetchMovies();
                },
                child: ListView(
                  children: [
                    ProductEmptyList(desc: 'home.discover.emptyList'.tr()),
                  ],
                ),
              );
            }
            return Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    await fetchMovies();
                  },
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: movies.length,
                    onPageChanged: loadMore,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Stack(
                        children: [
                          SizedBox.expand(
                            child: ProjectNetworkImage(
                              url: movie.poster,
                              boxFit: BoxFit.fill,
                            ),
                          ),
                          customBottomMoviePlot(context, movie),
                        ],
                      );
                    },
                  ),
                ),
                if (state.isLoading)
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: ColoredBox(
                        color: Colors.black.withValues(alpha: 0.3),
                        child: const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Positioned customBottomMoviePlot(BuildContext context, Movie movie) {
    return Positioned(
      left: 0,
      right: 16,
      bottom: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setFavorite(movie);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  shape: BoxShape.circle,
                ),
                child: BlocBuilder<DiscoverViewModel, DiscoverState>(
                  builder: (context, state) {
                    return Icon(
                      movie.isFavorite.ext.isSuccess
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                      size: 28,
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Theme.of(context).colorScheme.surface.withValues(alpha: 1),
                  Colors.transparent,
                ],
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: Assets.images.producer.toGetImage().image,
              ),
              title: Text(
                movie.title.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: ReadMoreWidget(
                text: movie.plot.toString(),
                moreCustomStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.normal),
                trimCollapsedText: 'home.discover.readMore.showLess'.tr(),
                trimExpandedText: 'home.discover.readMore.showMore'.tr(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
