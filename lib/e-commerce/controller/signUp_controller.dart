import 'package:get/get.dart';
import 'package:getx_project/e-commerce/webservice/webservice.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;

  Future<Map<String, dynamic>?> signUp(
      String email, String password, String name) async {
    final result = await Webservice.signUp(email, password, name);
    print("result in logincontroller =  $result");
    return result;
  }
}
