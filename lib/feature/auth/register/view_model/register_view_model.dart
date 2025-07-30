import 'package:architecture_template/feature/auth/register/view_model/state/register_state.dart';
import 'package:architecture_template/product/state/base/base_cubit.dart';

/// Login logic operations
final class RegisterViewModel extends BaseCubit<RegisterState> {
  RegisterViewModel() : super(const RegisterState(isLoading: false));

  /// Change is loading variable
  void changeLoading({bool isLoading = false}) {
    emit(state.copyWith(isLoading: isLoading));
  }

  /// Change isCheck bool value
  void changeChecked() {
    emit(state.copyWith(isChecked: !state.isChecked));
  }

  /// Change isObscure bool value
  void changeObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  /// The function `setPassword` updates the password in the state using the provided password value.
  ///
  /// Args:
  ///   password (String): The `setPassword` function takes a `String` parameter called `password` and
  /// updates the state by copying it with the new password value.
  void setPassword(String? password) {
    emit(state.copyWith(password: password));
  }

  void setEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  void setUsername(String? username) {
    emit(state.copyWith(username: username));
  }
}
