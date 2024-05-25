import 'dart:developer';

import 'package:get/get.dart';

class CartController extends GetxController {
  final RxList<CartModel> _list = <CartModel>[].obs;

  RxList<CartModel> get getItems {
    return _list;
  }

  int? get count {
    return _list.length;
  }

  double get totalPrice {
    double total = 0.00;
    for (var item in _list) {
      total += (item.price * item.qty.toInt());
    }
    return total;
  }

  void addItem(
    int id,
    String name,
    double price,
    RxInt qty,
    String image,
  ) {
    final product = CartModel(
      title: name,
      id: id,
      qty: qty,
      price: price,
      image: image,
    );
    _list.add(product);
    log(_list.toString());
  }

  void increment(CartModel product) {
    product.qty++;
  }

  void decrement(CartModel product) {
    product.qty--;
  }

  void removeItem(CartModel product) {
    _list.remove(product);
  }
}

class CartModel {
  String image;
  String title;
  int id;
  RxInt qty;
  double price;
  CartModel(
      {required this.image,
      required this.title,
      required this.id,
      required this.qty,
      required this.price});
}
