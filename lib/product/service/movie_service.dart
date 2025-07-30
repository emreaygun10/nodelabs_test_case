import 'package:architecture_template/product/service/interface/movie_operation.dart';
import 'package:architecture_template/product/service/manager/product_service_path.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

class MovieService extends MovieOperation {
  MovieService({required INetworkManager<EmptyModel> networkManager})
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<List<Movie>> favorites() async {
    try {
      final response = await _networkManager
          .send<FavoritiesResponseModel, FavoritiesResponseModel>(
        ProductServicePath.favorites.value,
        parseModel: FavoritiesResponseModel(),
        method: RequestType.GET,
      );

      return response.data?.data ?? [];
    } catch (e) {
      throw Exception('Failed to load favorite movies: ${e.toString()}');
    }
  }

  @override
  Future<List<Movie>> getList(int page) async {
    try {
      final response =
          await _networkManager.send<MovieResponseModel, MovieResponseModel>(
        ProductServicePath.movieList.value,
        parseModel: MovieResponseModel(),
        queryParameters: {'page': page},
        method: RequestType.GET,
      );

      return response.data?.data?.movies ?? [];
    } catch (e) {
      throw Exception('Failed to load movie list: ${e.toString()}');
    }
  }

  @override
  Future<FavoriteResponseModel> removeFavoriteMovieById(String id) async {
    try {
      final response = await _networkManager
          .send<FavoriteResponseModel, FavoriteResponseModel>(
        ProductServicePath.removeFavoriteMovie.withQuery(id),
        parseModel: FavoriteResponseModel(),
        method: RequestType.POST,
      );

      return response.data ?? FavoriteResponseModel();
    } catch (e) {
      throw Exception('Failed to remove favorite movie: ${e.toString()}');
    }
  }
}
