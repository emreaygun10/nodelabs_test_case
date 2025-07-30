import 'package:flutter/material.dart';

/// This Dart code snippet defines an enum called `Locales` with two values:
/// `tr` and `en`. Each enum
/// value is associated with a `Locale` object. The `tr` value is associated
/// with a `Locale` object
/// representing the Turkish locale ('tr', 'TR'), and the `en` value is
/// associated with a `Locale`
/// object representing the English locale ('en', 'US').
enum Locales {
  /// In the provided Dart code snippet, `tr(Locale('tr', 'TR'))` is defining one
  ///  of the enum values of
  /// the `Locales` enum.
  tr(Locale('tr', 'TR')),

  /// In the provided Dart code snippet, `en(Locale('en', 'US'))` is defining
  ///  one of the enum values of
  /// the `Locales` enum. It associates the `en` enum value with a `Locale`
  /// object representing the
  /// English locale with language code 'en' and country code 'US'. This allows
  ///  you to easily reference
  /// the English locale within your code using the `Locales.en` enum value.
  en(Locale('en', 'US'));

  /// The line `final Locale locale;` in the Dart code snippet is declaring a
  /// final instance variable
  /// `locale` of type `Locale` within the `Locales` enum. This variable is not
  ///  initialized in the enum
  /// declaration itself but will be set when each enum value is defined.
  final Locale locale;
  const Locales(this.locale);
}
