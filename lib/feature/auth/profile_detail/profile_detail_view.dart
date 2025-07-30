import 'dart:io';

import 'package:architecture_template/feature/auth/profile_detail/view_model/mixin/profile_detail_mixin.dart';
import 'package:architecture_template/feature/auth/profile_detail/view_model/profile_detail_view_model.dart';
import 'package:architecture_template/feature/auth/profile_detail/view_model/state/profile_detail_state.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/widget/padding/project_padding.dart';
import 'package:architecture_template/product/widget/product_app_bar_back_button.dart';
import 'package:architecture_template/product/widget/product_elevated_button.dart';
import 'package:architecture_template/product/widget/product_image_picker.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProfileDetailView extends StatefulWidget {
  const ProfileDetailView({super.key});

  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends BaseState<ProfileDetailView>
    with ProfileDetailMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => profileDetailViewModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text('auth.detail.title'.tr()),
            leading: const ProductAppBarBackButton(
              canPop: true,
            ),
          ),
          body: Padding(
            padding: const ProjectPadding.scaffoldPadding(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "auth.detail.upload".tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Padding(
                      padding: const ProjectPadding.verticalLager(),
                      child: Text(
                        'auth.detail.desc'.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                      onTap: () async {
                        final image = await ProductImagePicker.show(context);
                        if (image != null) {
                          profileDetailViewModel.setFile(File(image.path));
                        }
                      },
                      child: BlocBuilder<ProfileDetailViewModel,
                          ProfileDetailState>(
                        builder: (context, state) {
                          return Container(
                            height: 200.h,
                            width: 200.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32).r,
                              color: Theme.of(context).colorScheme.outline,
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .outlineVariant,
                              ),
                            ),
                            child: state.file != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(32).r,
                                    child: Image.file(
                                      state.file!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(
                                    Icons.add,
                                    size: 45,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.7),
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 5,
                ),
                ProductElevatedButton(
                  isLoading: false,
                  title: 'auth.detail.button',
                  onPressed: uploadPhotoForUser,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
