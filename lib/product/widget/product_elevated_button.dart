import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductElevatedButton extends StatelessWidget {
  const ProductElevatedButton(
      {super.key,
      this.onPressed,
      required this.isLoading,
      required this.title});

  final void Function()? onPressed;
  final bool isLoading;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.error,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                title.tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
      ),
    );
  }
}
