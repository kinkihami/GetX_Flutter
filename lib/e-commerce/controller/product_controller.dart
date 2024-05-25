import 'package:get/get.dart';
import 'package:getx_project/e-commerce/model/product_model.dart';
import 'package:getx_project/e-commerce/webservice/webservice.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productsList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var product = await Webservice.fetchProducts();
      if (product != null) {
        productsList.value = product;
      }
    } finally {
      isLoading(false);
    }
  }
}