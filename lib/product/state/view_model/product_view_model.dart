import 'package:architecture_template/product/state/base/base_cubit.dart';
import 'package:architecture_template/product/state/view_model/product_state.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends BaseCubit<ProductState> {
  ProductViewModel() : super(const ProductState());

  /// [themeMode] is [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  /// Change active page in bottom navigation bar
  void changeIndex(int index) {
    if (index >= 0) {
      emit(state.copyWith(currentIndex: index));
    }
  }
}
