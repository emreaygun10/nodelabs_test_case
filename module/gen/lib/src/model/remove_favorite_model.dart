import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remove_favorite_model.g.dart';

@JsonSerializable()
class RemoveFavoriteMovieModel extends INetworkModel<RemoveFavoriteMovieModel>
    with EquatableMixin {
  final bool? success;
  final String? message;

  RemoveFavoriteMovieModel({
    this.success,
    this.message,
  });

  @override
  RemoveFavoriteMovieModel fromJson(Map<String, dynamic> json) =>
      RemoveFavoriteMovieModel.fromJson(json);

  factory RemoveFavoriteMovieModel.fromJson(Map<String, dynamic> json) =>
      _$RemoveFavoriteMovieModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$RemoveFavoriteMovieModelToJson(this);

  @override
  List<Object?> get props => [success, message];

  RemoveFavoriteMovieModel copyWith({
    bool? success,
    String? message,
  }) {
    return RemoveFavoriteMovieModel(
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }
}
