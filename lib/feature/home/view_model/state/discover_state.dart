// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class DiscoverState extends Equatable {
  const DiscoverState({
    required this.isLoading,
    this.currentPage = 1,
    this.movies,
  });

  final bool isLoading;
  final int currentPage;
  final List<Movie>? movies;

  @override
  List<Object?> get props => [
        isLoading,
        currentPage,
        movies,
      ];

  DiscoverState copyWith(
      {bool? isLoading, int? currentPage, List<Movie>? movies}) {
    return DiscoverState(
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      movies: movies ?? this.movies,
    );
  }
}
