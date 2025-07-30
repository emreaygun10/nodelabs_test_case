// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class ProfileState extends Equatable {
  const ProfileState({
    required this.isLoading,
    this.user,
    this.favoriteList,
  });

  final bool isLoading;
  final User? user;
  final List<Movie>? favoriteList;

  @override
  List<Object?> get props => [
        isLoading,
        user,
        favoriteList,
      ];

  ProfileState copyWith({
    bool? isLoading,
    User? user,
    List<Movie>? favoriteList,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      favoriteList: favoriteList ?? this.favoriteList,
      user: user ?? this.user,
    );
  }
}
