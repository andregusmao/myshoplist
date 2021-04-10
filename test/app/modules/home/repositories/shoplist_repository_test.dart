import 'package:flutter_test/flutter_test.dart';
import 'package:myshoplist/app/modules/home/repositories/shoplist_repository.dart';
 
void main() {
  late ShoplistRepository repository;

  setUpAll(() {
    repository = ShoplistRepository();
  });
}