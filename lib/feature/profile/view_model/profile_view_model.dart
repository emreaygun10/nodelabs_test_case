import 'package:architecture_template/feature/profile/view_model/state/profile_state.dart';
import 'package:architecture_template/product/state/base/base_cubit.dart';
import 'package:gen/gen.dart';

final class ProfileViewModel extends BaseCubit<ProfileState> {
  ProfileViewModel()
      : super(
          ProfileState(
            isLoading: false,
          ),
        );

  void changeLoading({bool isLoading = false}) {
    emit(state.copyWith(isLoading: isLoading));
  }

  void setUserInfo(User user) {
    emit(state.copyWith(user: user));
  }

  void setFavoriteList(List<Movie> movieList) {
    emit(state.copyWith(favoriteList: List<Movie>.of(movieList)));
  }
}
