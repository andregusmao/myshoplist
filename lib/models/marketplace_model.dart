import 'package:intl/intl.dart';
import 'package:myshoplist/constants/marketplace_constants.dart';

class MarketplaceModel {
  final int? id;
  final String name;
  final String? address;
  final String? latitude;
  final String? longitude;
  final DateTime createdAt;
  final DateTime? updatedAt;

  MarketplaceModel({
    this.id,
    required this.name,
    this.address,
    this.latitude,
    this.longitude,
    required this.createdAt,
    this.updatedAt,
  });

  static MarketplaceModel readData(Map<String, dynamic> data) {
    return MarketplaceModel(
      id: data[MARKETPLACE_COLUMN_ID],
      name: data[MARKETPLACE_COLUMN_NAME],
      address: data[MARKETPLACE_COLUMN_ADDRESS],
      latitude: data[MARKETPLACE_COLUMN_LATITUDE],
      longitude: data[MARKETPLACE_COLUMN_LONGITUDE],
      createdAt: data[MARKETPLACE_COLUMN_CREATE_DATE],
      updatedAt: data[MARKETPLACE_COLUMN_UPDATE_DATE],
    );
  }

  Map<String, dynamic> writeData() {
    final map = Map<String, dynamic>();
    map[MARKETPLACE_COLUMN_ID] = this.id;
    map[MARKETPLACE_COLUMN_NAME] = this.name;
    map[MARKETPLACE_COLUMN_ADDRESS] = this.address;
    map[MARKETPLACE_COLUMN_LATITUDE] = this.latitude;
    map[MARKETPLACE_COLUMN_LONGITUDE] = this.longitude;
    if (this.id == null) {
      map[MARKETPLACE_COLUMN_CREATE_DATE] =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    } else {
      map[MARKETPLACE_COLUMN_UPDATE_DATE] =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    }

    return map;
  }
}
