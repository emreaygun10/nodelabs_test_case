import 'package:architecture_template/feature/home/view_model/state/discover_state.dart';
import 'package:architecture_template/product/state/base/base_cubit.dart';
import 'package:gen/gen.dart';

final class DiscoverViewModel extends BaseCubit<DiscoverState> {
  DiscoverViewModel()
      : super(
          DiscoverState(
            isLoading: false,
          ),
        );

  void changeLoading({bool isLoading = false}) {
    emit(state.copyWith(isLoading: isLoading));
  }

  void setCurrentPage(int currentPage) {
    emit(state.copyWith(currentPage: currentPage));
  }

  void increaseCurrentPage() {
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }

  void addMovieToList(List<Movie> movies) {
    final updatedMovies = List<Movie>.from(state.movies ?? [])..addAll(movies);
    emit(state.copyWith(movies: updatedMovies));
  }

  void addFirstTimeMovieToList(List<Movie> movies) {
    final updatedMovies = List<Movie>.from([])..addAll(movies);
    emit(state.copyWith(movies: updatedMovies));
  }

  void updateMovie(Movie updatedMovie) {
    if (state.movies == null) return;

    final movieIndex =
        state.movies!.indexWhere((movie) => movie.id == updatedMovie.id);
    if (movieIndex == -1) return;

    final updatedMovies = List<Movie>.from(state.movies!)
      ..[movieIndex] = updatedMovie;

    emit(state.copyWith(movies: updatedMovies));
  }
}
