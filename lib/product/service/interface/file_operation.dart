import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

/// AuthenticationOperation is abstract class for [LoginService]
abstract class FileOperation {
  /// Login Operation
  Future<User> uploadPhoto(FormData formatData);
}
