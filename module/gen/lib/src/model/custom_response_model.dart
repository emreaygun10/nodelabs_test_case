import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'custom_response_model.g.dart';

@JsonSerializable()
class CustomResponseModel extends INetworkModel<CustomResponseModel> with EquatableMixin {
  final int? code;
  final String? message;

  CustomResponseModel({
    this.code,
    this.message,
  });

  @override
  CustomResponseModel fromJson(Map<String, dynamic> json) => CustomResponseModel.fromJson(json);

  factory CustomResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CustomResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CustomResponseModelToJson(this);

  @override
  List<Object?> get props => [code, message];

  CustomResponseModel copyWith({
    int? code,
    String? message,
  }) {
    return CustomResponseModel(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }
}
