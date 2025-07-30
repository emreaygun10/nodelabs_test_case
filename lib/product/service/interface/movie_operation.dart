import 'package:gen/gen.dart';

abstract class MovieOperation {
  /// Get All User Favorite Movies
  Future<List<Movie>> favorites();

  /// Remove Selected Movie by movie's id
  Future<FavoriteResponseModel> removeFavoriteMovieById(String id);

  /// Get Movie List With Pagination info
  Future<List<Movie>> getList(int page);
}
