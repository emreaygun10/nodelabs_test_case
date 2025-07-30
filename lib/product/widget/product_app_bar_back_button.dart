import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProductAppBarBackButton extends StatelessWidget {
  const ProductAppBarBackButton({super.key, this.canPop = false});
  final bool canPop;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: canPop ? () => context.router.maybePop() : null,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.outline,
          ),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
