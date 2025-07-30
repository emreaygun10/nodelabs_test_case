import 'dart:io';

import 'package:equatable/equatable.dart';

/// Class has login state variables
final class ProfileDetailState extends Equatable {
  /// The line `const ProfileDetailState({required this.isLoading, this.user});` is
  /// defining a constructor
  /// for the `ProfileDetailState` class.
  const ProfileDetailState({
    required this.isLoading,
    this.file,
  });

  /// check loading operation is continuous
  final bool isLoading;

  /// Select file
  final File? file;

  @override
  List<Object?> get props => [
        isLoading,
        file,
      ];

  // ignore: public_member_api_docs
  ProfileDetailState copyWith({bool? isLoading, File? file}) {
    return ProfileDetailState(
      isLoading: isLoading ?? this.isLoading,
      file: file ?? this.file,
    );
  }
}
