import 'package:get/get.dart';
import 'package:getx_project/e-commerce/webservice/webservice.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<Map<String, dynamic>?> login(String username, String password) async {
    final result = await Webservice.login(username, password);
    print("result in logincontroller =  $result");
    return result;
  }
}
