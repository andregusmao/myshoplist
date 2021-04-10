import 'package:flutter_test/flutter_test.dart';
import 'package:myshoplist/app/modules/home/services/shoplist_service.dart';
 
void main() {
  late ShoplistService service;

  setUpAll(() {
    service = ShoplistService();
  });
}