import 'package:architecture_template/product/service/manager/models/sign_up_model.dart';
import 'package:architecture_template/product/service/register_service.dart';
import 'package:gen/gen.dart';

/// AuthenticationOperation is abstract class for [RegisterService]
abstract class RegisterOperation {
  /// Login Operation
  Future<AuthResponseModel> register(SignUpModel model);
}
