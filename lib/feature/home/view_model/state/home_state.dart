// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class HomeState extends Equatable {
  const HomeState({
    required this.isLoading,
  });

  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];

  HomeState copyWith({
    bool? isLoading,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
