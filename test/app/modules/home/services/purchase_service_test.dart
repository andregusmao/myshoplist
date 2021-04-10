import 'package:flutter_test/flutter_test.dart';
import 'package:myshoplist/app/modules/home/services/purchase_service.dart';
 
void main() {
  late PurchaseService service;

  setUpAll(() {
    service = PurchaseService();
  });
}