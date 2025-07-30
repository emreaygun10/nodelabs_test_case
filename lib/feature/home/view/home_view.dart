import 'package:architecture_template/feature/home/view_model/mixin/home_view_mixin.dart';
import 'package:architecture_template/product/state/base/base_state.dart';
import 'package:architecture_template/product/state/view_model/product_state.dart';
import 'package:architecture_template/product/state/view_model/product_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productViewModel,
      child: BlocBuilder<ProductViewModel, ProductState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: IndexedStack(index: state.currentIndex, children: pages),
            ),
            //For Remove animation
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: state.currentIndex,
                onTap: changeIndex,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: state.currentIndex == 0
                            ? Colors.blue
                            : Colors.transparent,
                        border: Border.all(
                          color: state.currentIndex == 0
                              ? Colors.blue
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.home, size: 24),
                          SizedBox(width: 6.h),
                          Text(
                            'home.navigation.home'.tr(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: state.currentIndex == 1
                            ? Colors.blue
                            : Colors.transparent,
                        border: Border.all(
                          color: state.currentIndex == 1
                              ? Colors.blue
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.person, size: 24),
                          SizedBox(width: 6.h),
                          Text(
                            'home.navigation.profile'.tr(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
