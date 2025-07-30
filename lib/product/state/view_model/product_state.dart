// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductState extends Equatable {
  const ProductState({this.themeMode = ThemeMode.dark, this.currentIndex = 0});

  final ThemeMode themeMode;
  final int currentIndex;
  @override
  List<Object?> get props => [themeMode, currentIndex];

  ProductState copyWith({
    ThemeMode? themeMode,
    int? currentIndex,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
