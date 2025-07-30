import 'package:architecture_template/feature/profile/view_model/mixin/profile_mixin.dart';
import 'package:architecture_template/feature/profile/view_model/profile_view_model.dart';
import 'package:architecture_template/feature/profile/view_model/state/profile_state.dart';
import 'package:architecture_template/feature/profile/widgets/premium_offer_sheet.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/widget/padding/project_padding.dart';
import 'package:architecture_template/product/widget/product_app_bar_back_button.dart';
import 'package:architecture_template/product/widget/product_empty_list_widget.dart';
import 'package:architecture_template/product/widget/product_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView> with ProfileMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileViewModel,
      child: Scaffold(
        appBar: customAppBar(context),
        body: BlocBuilder<ProfileViewModel, ProfileState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.user != null)
                    customUserInfoListTile(state, context),
                  customFavoriteTitle(context),
                  if (state.favoriteList.ext.isNotNullOrEmpty)
                    customFavoritiesList(state)
                  else
                    ProductEmptyList(
                      desc: 'auth.profile.emptyFavorites'.tr(),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Padding customFavoriteTitle(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffoldPadding().copyWith(bottom: 10.h),
      child: Text(
        'auth.profile.favoriteMovies'.tr(),
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  GridView customFavoritiesList(ProfileState state) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemCount: state.favoriteList!.length,
      itemBuilder: (context, index) {
        return customMovieCard(
          context,
          state.favoriteList![index],
        );

        // return _buildFilmCard(state.favoriteList![index]);
      },
    );
  }

  Padding customUserInfoListTile(ProfileState state, BuildContext context) {
    return Padding(
      padding: const ProjectPadding.verticalLager(),
      child: ListTile(
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(state.user!.photoUrl ?? ''),
        ),
        title: Text(state.user!.name ?? 'auth.profile.notFound'.tr()),
        subtitle: Text(
          "ID: ${state.user!.id ?? 'auth.profile.notFound'.tr()}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: GestureDetector(
          onTap: () => context.router.push(const ProfileDetailRoute()),
          child: Container(
            padding: const ProjectPadding.allSmall(),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'auth.profile.addPhoto'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: const ProductAppBarBackButton(),
      title: Text(
        'auth.profile.title'.tr(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: [
        ElevatedButton.icon(
          icon: Assets.icons.icProfilDiamond.toGetSvg(),
          label: Text(
            'auth.profile.limitedOffer'.tr(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.error,
            ),
            foregroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.onError,
            ),
            padding: WidgetStateProperty.all(
              const ProjectPadding.allSmall(),
            ),
          ),
          onPressed: () async {
            await showModalBottomSheet<void>(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) => const PremiumOfferSheet(),
            );
          },
        )
      ],
    );
  }

  Column customMovieCard(BuildContext context, Movie movie) {
    return Column(
      children: [
        Container(
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ProjectNetworkImage(url: movie.poster),
        ),
        Text(movie.title ?? ''),
        Text('auth.profile.imdb'
            .tr(namedArgs: {"rating": movie.imdbRating.toString()}))
      ],
    );
  }
}
