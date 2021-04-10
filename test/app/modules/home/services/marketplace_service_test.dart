import 'package:flutter_test/flutter_test.dart';
import 'package:myshoplist/app/modules/home/services/marketplace_service.dart';
 
void main() {
  late MarketplaceService service;

  setUpAll(() {
    service = MarketplaceService();
  });
}