import 'package:flutter/src/widgets/image.dart';
import 'package:gen/src/asset/assets.gen.dart';

extension ImageExtension on AssetGenImage {
  /// Image extension with just package
  Image toGetImage() => image(package: 'gen');
  Image get() => image(package: 'gen');
}
