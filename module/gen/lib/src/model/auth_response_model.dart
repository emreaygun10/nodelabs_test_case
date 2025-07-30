import 'package:equatable/equatable.dart';
import 'package:gen/src/model/user.dart';
import 'package:gen/src/model/custom_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel extends INetworkModel<AuthResponseModel>
    with EquatableMixin {
  final CustomResponseModel? response;
  final User? data;

  AuthResponseModel({
    this.response,
    this.data,
  });

  @override
  AuthResponseModel fromJson(Map<String, dynamic> json) =>
      AuthResponseModel.fromJson(json);

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AuthResponseModelToJson(this);

  @override
  List<Object?> get props => [response, data];

  AuthResponseModel copyWith({
    CustomResponseModel? response,
    User? data,
  }) {
    return AuthResponseModel(
      response: response ?? this.response,
      data: data ?? this.data,
    );
  }
}




