import 'dart:ui';

import 'package:gen/src/asset/assets.gen.dart';
import 'package:lottie/lottie.dart';

extension LottieExtension on LottieGenImage {
  /// Lottie extension with just package
  LottieBuilder toGetLottie() => lottie(package: 'gen');

  /// Lottie extension with size
  LottieBuilder toGetLottieWithSize({required Size size}) => lottie(
        package: 'gen',
        height: size.height,
        width: size.width,
      );
}
