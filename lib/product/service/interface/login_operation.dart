import 'package:architecture_template/product/service/manager/models/login_model.dart';
import 'package:gen/gen.dart';

/// AuthenticationOperation is abstract class for [LoginService]
abstract class LoginOperation {
  /// Login Operation
  Future<AuthResponseModel> login(LoginModel model);
}
