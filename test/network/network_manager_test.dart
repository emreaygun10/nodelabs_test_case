import 'package:architecture_template/product/init/config/app_environment.dart';
import 'package:architecture_template/product/service/manager/product_network_manager.dart';
import 'package:architecture_template/product/service/manager/product_service_path.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final ProductNetworkManager manager;
  setUp(() {
    AppEnvironment.general();
    manager = ProductNetworkManager.base();
  });
  test('get favorites items from api', () async {
    final response = await manager.send<User, User>(
      ProductServicePath.login.value,
      parseModel: User(),
      method: RequestType.POST,
      data: {
        'email': 'emreaygun@nodelabs.com',
        'password': '123456',
      },
    );

    expect(response.data, isNotNull);
  });
}
