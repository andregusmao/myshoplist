import 'package:flutter_test/flutter_test.dart';
import 'package:myshoplist/app/modules/home/services/product_service.dart';
 
void main() {
  late ProductService service;

  setUpAll(() {
    service = ProductService();
  });
}