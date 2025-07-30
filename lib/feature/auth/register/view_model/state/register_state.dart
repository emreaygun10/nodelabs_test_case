import 'package:equatable/equatable.dart';

/// Class has login state variables
final class RegisterState extends Equatable {
  /// The line `const RegisterState({required this.isLoading, this.user});` is
  /// defining a constructor
  /// for the `RegisterState` class.
  const RegisterState({
    required this.isLoading,
    this.username,
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

  ///Name
  final String? username;

  ///Email
  final String? email;

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

  @override
  List<Object?> get props => [
        isLoading,
        username,
        isCompleted,
        isError,
        errorMessage,
        isChecked,
        isObscure,
        password,
        email,
      ];

  // ignore: public_member_api_docs
  RegisterState copyWith({
    bool? isLoading,
    String? username,
    bool? isCompleted,
    bool? isError,
    String? errorMessage,
    bool? isChecked,
    bool? isObscure,
    String? password,
    String? email,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
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
