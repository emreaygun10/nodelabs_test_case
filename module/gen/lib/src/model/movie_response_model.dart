import 'package:equatable/equatable.dart';
import 'package:gen/src/model/model.dart';
import 'package:gen/src/model/movie_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
 

part 'movie_response_model.g.dart';

@JsonSerializable()
class MovieResponseModel extends INetworkModel<MovieResponseModel>
    with EquatableMixin {
  final CustomResponseModel? response;
  final MovieDataModel? data;

  MovieResponseModel({
    this.response,
    this.data,
  });

  @override
  MovieResponseModel fromJson(Map<String, dynamic> json) =>
      MovieResponseModel.fromJson(json);

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MovieResponseModelToJson(this);

  @override
  List<Object?> get props => [response, data];

  MovieResponseModel copyWith({
    CustomResponseModel? response,
    MovieDataModel? data,
  }) {
    return MovieResponseModel(
      response: response ?? this.response,
      data: data ?? this.data,
    );
  }
}
