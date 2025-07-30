import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

/// Class has login state variables
final class LoginState extends Equatable {
  /// The line `const LoginState({required this.isLoading, this.user});` is
  /// defining a constructor
  /// for the `LoginState` class.
  const LoginState({
    required this.isLoading,
    this.user,
    this.isError = false,
    this.isCompleted = false,
    this.errorMessage,
    this.isChecked = false,
    this.isObscure = true,
    this.password,
    this.email,
  });

  /// check loading operation is continuous
  final bool isLoading;

  /// User information
  final AuthResponseModel? user;

  /// checks login operation result
  final bool isCompleted;

  /// checks api error
  final bool isError;

  /// error message from login errors
  final String? errorMessage;

  /// Check box is checked
  final bool isChecked;

  /// text field is obscure
  final bool isObscure;

  /// entered password
  final String? password;

  ///entered email address
  final String? email;
  @override
  List<Object?> get props => [
        isLoading,
        user,
        isCompleted,
        isError,
        errorMessage,
        isChecked,
        isObscure,
        password,
        email,
      ];

  // ignore: public_member_api_docs
  LoginState copyWith({
    bool? isLoading,
    AuthResponseModel? user,
    bool? isCompleted,
    bool? isError,
    String? errorMessage,
    bool? isChecked,
    bool? isObscure,
    String? password,
    String? email,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? user,
      isCompleted: isCompleted ?? false,
      isError: isError ?? false,
      errorMessage: errorMessage ?? this.errorMessage,
      isChecked: isChecked ?? this.isChecked,
      isObscure: isObscure ?? this.isObscure,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }
}
