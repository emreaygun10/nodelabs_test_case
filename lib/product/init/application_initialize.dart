import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:architecture_template/firebase_options.dart';
import 'package:architecture_template/product/init/config/app_environment.dart';
import 'package:architecture_template/product/state/container/product_state_container.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

@immutable

/// This class is used to initialize the application process
final class ApplicationInitialize {
  /// project basic required initialize
  Future<void> make() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await DeviceUtility.instance.initPackageInfo();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = (details) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      Logger().e(details.exceptionAsString());
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    _productEnvironmentWithContainer();
    await ProductStateItems.productCache.setup();
    if (ProductStateItems.productCache.userCacheOperation
                .getAll()
                .firstOrNull !=
            null &&
        ProductStateItems.productCache.userCacheOperation
                .getAll()
                .firstOrNull!
                .user
                .token !=
            null) {
      ProductStateItems.productNetworkManager.addBaseHeader(
        MapEntry(
          HttpHeaders.authorizationHeader,
          ProductStateItems.productCache.userCacheOperation
              .getAll()
              .firstOrNull!
              .user
              .token!,
        ),
      );
    }
    FlutterNativeSplash.remove();
  }

  /// DO NOT CHANGE THIS METHOD
  void _productEnvironmentWithContainer() {
    AppEnvironment.general();
    ProductContainer.setup();
  }
}
