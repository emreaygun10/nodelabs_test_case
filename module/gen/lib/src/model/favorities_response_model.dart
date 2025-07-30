import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'favorities_response_model.g.dart';

@JsonSerializable()
class FavoritiesResponseModel extends INetworkModel<FavoritiesResponseModel>
    with EquatableMixin {
  final CustomResponseModel? response;
  final List<Movie>? data;

  FavoritiesResponseModel({
    this.response,
    this.data,
  });

  @override
  FavoritiesResponseModel fromJson(Map<String, dynamic> json) =>
      FavoritiesResponseModel.fromJson(json);

  factory FavoritiesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritiesResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FavoritiesResponseModelToJson(this);

  @override
  List<Object?> get props => [response, data];

  FavoritiesResponseModel copyWith({
    CustomResponseModel? response,
    List<Movie>? data,
  }) {
    return FavoritiesResponseModel(
      response: response ?? this.response,
      data: data ?? this.data,
    );
  }
}
