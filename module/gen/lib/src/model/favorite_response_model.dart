import 'package:gen/src/index.dart';
import 'package:gen/src/model/favorite_data_model.dart';
import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'favorite_response_model.g.dart';

@JsonSerializable()
class FavoriteResponseModel extends INetworkModel<FavoriteResponseModel>
    with EquatableMixin {
  final CustomResponseModel? response;
  final FavoriteDataModel? data;

  FavoriteResponseModel({
    this.response,
    this.data,
  });

  @override
  FavoriteResponseModel fromJson(Map<String, dynamic> json) =>
      FavoriteResponseModel.fromJson(json);

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FavoriteResponseModelToJson(this);

  @override
  List<Object?> get props => [response, data];

  FavoriteResponseModel copyWith({
    CustomResponseModel? response,
    FavoriteDataModel? data,
  }) {
    return FavoriteResponseModel(
      response: response ?? this.response,
      data: data ?? this.data,
    );
  }
}
