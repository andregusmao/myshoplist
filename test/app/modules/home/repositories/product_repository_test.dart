import 'package:flutter_test/flutter_test.dart';
import 'package:myshoplist/app/modules/home/repositories/product_repository.dart';
 
void main() {
  late ProductRepository repository;

  setUpAll(() {
    repository = ProductRepository();
  });
}