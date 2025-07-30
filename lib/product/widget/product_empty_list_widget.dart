import 'package:architecture_template/product/widget/padding/project_padding.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

class ProductEmptyList extends StatelessWidget {
  const ProductEmptyList({
    required this.desc,
    super.key,
  });
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.lotties.empty.toGetLottie(),
        Padding(
          padding: const ProjectPadding.allMedium(),
          child: Container(
            width: double.infinity,
            color: Colors.black,
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.error),
            ),
          ),
        )
      ],
    );
  }
}
