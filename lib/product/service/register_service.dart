import 'dart:io';

import 'package:architecture_template/product/service/interface/register_operation.dart';
import 'package:architecture_template/product/service/manager/models/sign_up_model.dart';
import 'package:architecture_template/product/service/manager/product_service_path.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

final class RegisterService extends RegisterOperation {
  RegisterService({required INetworkManager<EmptyModel> networkManager})
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<AuthResponseModel> register(SignUpModel model) async {
    try {
      final response =
          await _networkManager.send<AuthResponseModel, AuthResponseModel>(
        ProductServicePath.register.value,
        parseModel: AuthResponseModel(),
        method: RequestType.POST,
        data: model.toJson(),
      );
      _networkManager.allHeaders.clear();
      _networkManager.addBaseHeader(
        MapEntry(
          HttpHeaders.authorizationHeader,
          'Bearer ${response.data?.data?.token}',
        ),
      );
      return response.data ?? AuthResponseModel();
    } catch (e) {
      throw Exception('Failed to register: ${e.toString()}');
    }
  }
}
