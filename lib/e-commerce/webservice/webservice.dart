import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/e-commerce/model/response_model.dart';
import 'package:getx_project/e-commerce/model/product_model.dart';
import 'package:getx_project/login.dart';
import 'package:http/http.dart' as http;

class Webservice {
  static Future<Map<String, dynamic>?> login(
      String email, String password) async {
    final Map<String, dynamic> postt = {'email': email, 'password': password};
    final response = await http.post(
        Uri.parse('http://192.168.29.39:8080/GetX_Project/login.jsp'),
        body: postt);
    if (response.statusCode == 200) {
      if (response.body.contains('success')) {
        log("response ==" + response.statusCode.toString());

        log("response ==" + response.body);
        var jsonString = response.body;

        var result;
        ResponseModel ws = responseModelFromJson(jsonString);
        result = {'status': true, 'message': ws.msg, 'WebService': ws};
        box.write('isLogged', true);
        return result;
      } else {
        Get.snackbar(
          'Login failed',
          'Enter correct login details',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[900],
          colorText: Colors.white,
        );
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<Map<String, dynamic>?> signUp(
      String email, String password, String name) async {
    final Map<String, dynamic> postt = {
      'email': email,
      'password': password,
      'name': name
    };
    final response = await http.post(
        Uri.parse('http://192.168.29.39:8080/GetX_Project/register.jsp'),
        body: postt);
    if (response.statusCode == 200) {
      if (response.body.contains('Success')) {
        log("response ==" + response.statusCode.toString());

        log("response ==" + response.body);
        var jsonString = response.body;

        var result;
        ResponseModel ws = responseModelFromJson(jsonString);
        result = {'status': true, 'message': ws.msg, 'WebService': ws};
        box.write('isLogged', true);
        return result;
      } else {
        Get.snackbar(
          'Error',
          'Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[900],
          colorText: Colors.white,
        );
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<List<ProductModel>?> fetchProducts() async {
    var response = await http
        .get(Uri.parse('http://192.168.29.39:8080/GetX_Project/products.jsp'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      log("response =" + response.body.toString());
      return productModelFromJson(jsonString);
    } else {
      return null;
    }
  }
}
