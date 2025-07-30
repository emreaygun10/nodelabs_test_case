import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

final class ReadMoreWidget extends StatelessWidget {
  const ReadMoreWidget({
    super.key,
    required this.text,
    required this.trimCollapsedText,
    required this.trimExpandedText,
    required this.style,
    this.color = Colors.white,
    required this.moreCustomStyle,
  });

  final String text;
  final String trimCollapsedText;
  final String trimExpandedText;
  final TextStyle style;
  final Color color;
  final TextStyle moreCustomStyle;
  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      text,
      collapseText: trimCollapsedText,
      expandText: trimExpandedText,
      linkStyle: moreCustomStyle,
      linkColor: color,
      style: style,
    );
  }
}
