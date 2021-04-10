import 'package:myshoplist/app/constants/marketplace_constants.dart';

class MarketplaceModel {
  final int? id;
  final String name;
  final String address;
  final String latitude;
  final String longitude;
  final DateTime createDate;
  final DateTime? updateDate;

  MarketplaceModel({
    this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.createDate,
    this.updateDate,
  });

  static MarketplaceModel fromMap(Map<String, dynamic> data) {
    return MarketplaceModel(
      id: data[MARKETPLACE_COLUMN_ID],
      name: data[MARKETPLACE_COLUMN_NAME],
      address: data[MARKETPLACE_COLUMN_ADDRESS],
      latitude: data[MARKETPLACE_COLUMN_LATITUDE],
      longitude: data[MARKETPLACE_COLUMN_LONGITUDE],
      createDate: data[MARKETPLACE_COLUMN_CREATE_DATE],
      updateDate: data[MARKETPLACE_COLUMN_UPDATE_DATE],
    );
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map[MARKETPLACE_COLUMN_ID] = this.id;
    map[MARKETPLACE_COLUMN_NAME] = this.name;
    map[MARKETPLACE_COLUMN_ADDRESS] = this.address;
    map[MARKETPLACE_COLUMN_LATITUDE] = this.latitude;
    map[MARKETPLACE_COLUMN_LONGITUDE] = this.longitude;
    map[MARKETPLACE_COLUMN_CREATE_DATE] = this.createDate;
    map[MARKETPLACE_COLUMN_UPDATE_DATE] = this.updateDate;

    return map;
  }
}
