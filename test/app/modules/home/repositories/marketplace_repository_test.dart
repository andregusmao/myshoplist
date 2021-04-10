import 'package:flutter_test/flutter_test.dart';
import 'package:myshoplist/app/modules/home/repositories/marketplace_repository.dart';
 
void main() {
  late MarketplaceRepository repository;

  setUpAll(() {
    repository = MarketplaceRepository();
  });
}