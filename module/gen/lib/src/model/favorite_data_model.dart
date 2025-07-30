import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'movie.dart';
part 'favorite_data_model.g.dart';

@JsonSerializable()
class FavoriteDataModel extends INetworkModel<FavoriteDataModel> with EquatableMixin {
  final Movie? movie;
  final String? action;

  FavoriteDataModel({
    this.movie,
    this.action,
  });

  @override
  FavoriteDataModel fromJson(Map<String, dynamic> json) => FavoriteDataModel.fromJson(json);

  factory FavoriteDataModel.fromJson(Map<String, dynamic> json) => _$FavoriteDataModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FavoriteDataModelToJson(this);

  @override
  List<Object?> get props => [movie, action];

  FavoriteDataModel copyWith({
    Movie? movie,
    String? action,
  }) {
    return FavoriteDataModel(
      movie: movie ?? this.movie,
      action: action ?? this.action,
    );
  }
}
