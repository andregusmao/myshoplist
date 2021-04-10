import 'package:flutter_test/flutter_test.dart';
import 'package:myshoplist/app/modules/home/repositories/purchase_repository.dart';
 
void main() {
  late PurchaseRepository repository;

  setUpAll(() {
    repository = PurchaseRepository();
  });
}