import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets/widgets.dart';

final class PremiumOfferSheet extends StatelessWidget {
  const PremiumOfferSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1F0505),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.r),
          bottom: Radius.circular(40.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -180.h,
            left: 0,
            right: 0,
            child: Container(
              height: 400.h,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.2.r,
                  colors: [
                    const Color(0xFFDC143C).withValues(alpha: 0.5),
                    const Color(0xFFDC143C).withValues(alpha: 0.1),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.3, 0.6],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'premium.offer.title'.tr(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'premium.offer.description'.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 24.h),
                  _buildBonusSection(context),
                  SizedBox(height: 24.h),
                  Text(
                    'premium.offer.selectPackageTitle'.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  SizedBox(height: 16.h),
                  _buildPackageOptions(context),
                  SizedBox(height: 16.h),
                  _buildShowAllButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBonusSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'premium.offer.bonusTitle'.tr(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBonusItem(
                context,
                Assets.images.diamond.toGetImage(),
                'premium.offer.bonuses.premiumAccount'.tr(),
              ),
              _buildBonusItem(
                context,
                Assets.images.loves.toGetImage(),
                'premium.offer.bonuses.moreMatches'.tr(),
              ),
              _buildBonusItem(
                context,
                Assets.images.arrow.toGetImage(),
                'premium.offer.bonuses.boost'.tr(),
              ),
              _buildBonusItem(
                context,
                Assets.images.loves.toGetImage(),
                'premium.offer.bonuses.moreLikes'.tr(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBonusItem(BuildContext context, Widget icon, String label) {
    return Column(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              radius: 0.8,
              stops: [0.5, 0.7, 0.9],
              colors: [
                Color.fromRGBO(111, 6, 11, 1),
                Color(0xFFFF69B4),
                Colors.yellowAccent,
              ],
            ),
          ),
          child: icon,
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }

  Widget _buildPackageOptions(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: _buildPackageCard(
              context,
              discount: '+10%',
              originalPrice: '300',
              discountedPrice: '330',
              weeklyPrice: '£99,99',
              isSelected: false,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: _buildPackageCard(context,
                discount: '+70%',
                originalPrice: '2.000',
                discountedPrice: '3.375',
                weeklyPrice: '£799,99',
                isSelected: true,
                highlightColors: const [
                  Color.fromARGB(255, 92, 77, 231),
                  Color.fromARGB(255, 140, 54, 142),
                  Color(0xFF800000),
                ],
                stops: const [
                  0.25,
                  0.5,
                  1.0
                ],
                colors: [
                  const Color.fromRGBO(89, 73, 230, 1),
                  Theme.of(context).colorScheme.onSurface,
                ]),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: _buildPackageCard(
              context,
              discount: '+35%',
              originalPrice: '1.000',
              discountedPrice: '1.350',
              weeklyPrice: '£399,99',
              isSelected: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageCard(
    BuildContext context, {
    required String discount,
    required String originalPrice,
    required String discountedPrice,
    required String weeklyPrice,
    required bool isSelected,
    List<Color> colors = const [Color(0xFF8B0000), Color(0xFF800000)],
    List<Color>? highlightColors,
    List<double>? stops,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 250.h,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(-0.6, -0.6),
              radius: 1.2,
              colors: highlightColors ??
                  const [
                    Color.fromARGB(255, 100, 7, 7),
                    Color.fromARGB(255, 205, 11, 11),
                  ],
              stops: stops ?? [0.25, 1.0],
            ),
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
              width: 0.7.w,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                originalPrice,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
              Text(
                discountedPrice,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                'premium.offer.tokenUnit'.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Spacer(),
              Divider(
                thickness: 0.1,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Text(
                weeklyPrice,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
              ),
              Text(
                'premium.offer.weeklyPrice'.tr(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 20,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.3),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(32).r,
                gradient: RadialGradient(
                  radius: 2.5,
                  colors: colors,
                  stops: const [0.4, 1.0],
                ),
              ),
              child: Text(
                textAlign: TextAlign.center,
                discount,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShowAllButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          await SuccessDialog.show(
            title: 'premium.offer.success'.tr(),
            context: context,
          );
          if (context.mounted) {
            await context.router.maybePop();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.error,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        child: Text(
          'premium.offer.showAllButton'.tr(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
