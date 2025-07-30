import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gen/src/asset/assets.gen.dart';

extension SvgExtension on SvgGenImage {
  /// For to get svg shortcut
  SvgPicture toGetSvg() => this.svg(package: 'gen');

  /// To get svg with color, height, width
  SvgPicture toGetSvgWithColor({
    required Color color,
    double? height,
    double? width,
  }) =>
      this.svg(
        package: 'gen',
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        height: height,
        width: width,
      );

  /// To get svg with height, width
  SvgPicture toGetSvgWithSize({required Size size}) => this.svg(
        package: 'gen',
        height: size.height,
        width: size.width,
      );
}
