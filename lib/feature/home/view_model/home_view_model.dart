import 'package:architecture_template/feature/home/view_model/state/home_state.dart';
import 'package:architecture_template/product/state/base/base_cubit.dart';

final class HomeViewModel extends BaseCubit<HomeState> {
  HomeViewModel() : super(const HomeState(isLoading: false));

  void changeLoading() {}
}
