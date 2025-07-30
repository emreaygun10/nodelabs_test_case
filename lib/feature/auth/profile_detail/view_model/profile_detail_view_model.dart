import 'dart:io';

import 'package:architecture_template/feature/auth/profile_detail/view_model/state/profile_detail_state.dart';
import 'package:architecture_template/product/state/base/base_cubit.dart';

/// Login logic operations
final class ProfileDetailViewModel extends BaseCubit<ProfileDetailState> {
  ProfileDetailViewModel() : super(const ProfileDetailState(isLoading: false));

  /// Change is loading variable
  void changeLoading({bool isLoading = false}) {
    emit(state.copyWith(isLoading: isLoading));
  }

  /// Set selected file
  void setFile(File file) {
    emit(state.copyWith(file: file));
  }
}
