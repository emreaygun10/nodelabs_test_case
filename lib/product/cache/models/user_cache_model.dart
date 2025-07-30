import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

final class UserCacheModel with CacheModel {
  UserCacheModel({required this.user});
  UserCacheModel.empty() : user = User();

  final User user;

  @override
  String get id => user.id.toString();

  @override
  UserCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<User>('Json cannot be null');
      return this;
    }
    return copyWith(
      user: User.fromJson(jsonMap),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return user.toJson() ?? {};
  }

  /// The `copyWith` function creates a new `UserCacheModel`
  /// instance with updated user data.
  ///
  /// Args:
  ///   user (User): The `copyWith` method in the code snippet
  /// is used to create a new instance of
  /// `UserCacheModel` with updated values. In this case,
  /// it takes an optional parameter `user` of type
  /// `User` and returns a new `UserCacheModel` object with the updated `user`
  ///
  /// Returns:
  ///   A new instance of UserCacheModel with the updated user property,
  /// using the provided user value
  /// if not null, or the existing user value if null.
  UserCacheModel copyWith({
    User? user,
  }) {
    return UserCacheModel(
      user: user ?? this.user,
    );
  }
}
