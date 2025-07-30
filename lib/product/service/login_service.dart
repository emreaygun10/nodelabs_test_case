import 'dart:io';

import 'package:architecture_template/product/service/interface/login_operation.dart';
import 'package:architecture_template/product/service/manager/models/login_model.dart';
import 'package:architecture_template/product/service/manager/product_service_path.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

class LoginService extends LoginOperation {
  LoginService({required INetworkManager<EmptyModel> networkManager})
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  Future<AuthResponseModel> login(LoginModel loginModel) async {
    var response = AuthResponseModel();
    await _networkManager
        .send<AuthResponseModel, AuthResponseModel>(
      ProductServicePath.login.value,
      parseModel: AuthResponseModel(),
      method: RequestType.POST,
      data: loginModel.toJson(),
    )
        .then((res) {
      _networkManager.allHeaders.clear();
      _networkManager.addBaseHeader(
        MapEntry(
          HttpHeaders.authorizationHeader,
          'Bearer ${res.data?.data?.token}',
        ),
      );
      response = res.data ?? AuthResponseModel();
    }).catchError((error) {
      throw Exception(
        'Login failed error: $error',
      );
    });
    return response;
  }
}
