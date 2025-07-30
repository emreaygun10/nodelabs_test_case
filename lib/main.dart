import 'package:architecture_template/product/init/application_initialize.dart';
import 'package:architecture_template/product/init/product_localization.dart';
import 'package:architecture_template/product/init/state_initialize.dart';
import 'package:architecture_template/product/init/theme/index.dart';
import 'package:architecture_template/product/navigation/app_router.dart';
import 'package:architecture_template/product/state/view_model/product_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

void main() async {
  await ApplicationInitialize().make();
  runApp(StateInitialize(child: ProductLocalization(child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: _appRouter.config(),
        builder: CustomResponsive.build,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: CustomLightTheme().themeData,
        darkTheme: CustomDarkTheme().themeData,
        themeMode: context.watch<ProductViewModel>().state.themeMode,
      ),
    );
  }
}
