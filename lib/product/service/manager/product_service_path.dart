// Project service path
// ignore_for_file: public_member_api_docs

enum ProductServicePath {
  login('user/login'),
  uploadProfilePhoto('user/upload_photo'),
  register('user/register'),
  movieList('movie/list'),
  removeFavoriteMovie('movie/favorite'),
  favorites('movie/favorites');

  final String value;
  const ProductServicePath(this.value);

  /// [withQuery] is add query to path
  ///
  /// Example: users/123
  String withQuery(String value) {
    return '${this.value}/$value';
  }
}
