import 'package:flutter/material.dart';

/// Project general padding items
final class ProjectPadding extends EdgeInsets {
  ///[ProjectPadding.allSmall] is 8
  const ProjectPadding.allSmall() : super.all(8);

  ///[ProjectPadding.allMedium] is 16
  const ProjectPadding.allMedium() : super.all(16);

  ///[ProjectPadding.allNormal] is 20
  const ProjectPadding.allNormal() : super.all(20);

  ///[ProjectPadding.allLarge] is 32
  const ProjectPadding.allLarge() : super.all(32);

  //Symmetric
  ///[ProjectPadding.scaffoldPadding] is 24
  const ProjectPadding.scaffoldPadding() : super.symmetric(horizontal: 24);

  ///[ProjectPadding.horizontalLager] is 20
  const ProjectPadding.horizontalLager() : super.symmetric(horizontal: 20);

  ///[ProjectPadding.horizontalMedium] is 14
  const ProjectPadding.horizontalMedium() : super.symmetric(horizontal: 14);

  ///[ProjectPadding.horizontalSmall] is 8
  const ProjectPadding.horizontalSmall() : super.symmetric(horizontal: 8);

  ///[ProjectPadding.inputDecorationPadding] left 18 and right 8
  const ProjectPadding.inputDecorationPadding()
      : super.only(
          left: 16,
          right: 8,
        );

  ///[ProjectPadding.verticalLager] is 20
  const ProjectPadding.verticalLager() : super.symmetric(vertical: 20);

  ///[ProjectPadding.verticalMedium] is 14
  const ProjectPadding.verticalMedium() : super.symmetric(vertical: 14);

  ///[ProjectPadding.verticalSmall] is 8
  const ProjectPadding.verticalSmall() : super.symmetric(vertical: 8);

  //Left,Right,Top,Bottom
  ///[ProjectPadding.onlyShimmerTextMedium] use for shimmer text
  const ProjectPadding.onlyShimmerTextMedium()
      : super.only(top: 16, right: 16, left: 16);

  /// Bottom
  ///[ProjectPadding.bottomSmall] is 5
  const ProjectPadding.bottomSmall() : super.only(bottom: 5);
}
