import 'package:sqflite/sqflite.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/constants/marketplace_constants.dart';
import 'package:myshoplist/database/database_helper.dart';
import 'package:myshoplist/modules/app/models/marketplace_model.dart';
import 'package:myshoplist/modules/app/repositories/interfaces/marketplace_repository_interface.dart';

class MarketplaceRepository extends Disposable
    implements IMarketplaceRepository {
  Future<Database> _database() => DatabaseHelper.instance.database;

  @override
  Future<List<MarketplaceModel>> getAll() async {
    final Database db = await _database();

    try {
      final marketplaces = await db.query(MARKETPLACE_TABLE);
      return List.generate(
        marketplaces.length,
        (index) {
          var x = 1;
          MarketplaceModel model = MarketplaceModel(
            id: marketplaces[index][MARKETPLACE_COLUMN_ID] as int,
            name: marketplaces[index][MARKETPLACE_COLUMN_NAME] as String,
            address: marketplaces[index][MARKETPLACE_COLUMN_ADDRESS] as String?,
            latitude:
                marketplaces[index][MARKETPLACE_COLUMN_LATITUDE] as String?,
            longitude:
                marketplaces[index][MARKETPLACE_COLUMN_LONGITUDE] as String?,
            createDate: DateTime.tryParse(
                marketplaces[index][MARKETPLACE_COLUMN_CREATE_DATE].toString()),
            updateDate: DateTime.tryParse(
                marketplaces[index][MARKETPLACE_COLUMN_UPDATE_DATE].toString()),
          );
          return model;
        },
      );
    } catch (error) {
      print(error);
    }

    return [];
  }

  @override
  Future<MarketplaceModel> getById(int id) async {
    final Database db = await _database();

    try {
      List<Map<String, dynamic>> marketplace = await db.query(
        MARKETPLACE_TABLE,
        columns: [
          MARKETPLACE_COLUMN_ID,
          MARKETPLACE_COLUMN_NAME,
          MARKETPLACE_COLUMN_ADDRESS,
          MARKETPLACE_COLUMN_LATITUDE,
          MARKETPLACE_COLUMN_LONGITUDE,
          MARKETPLACE_COLUMN_CREATE_DATE,
          MARKETPLACE_COLUMN_UPDATE_DATE
        ],
        where: '$MARKETPLACE_COLUMN_ID = ?',
        whereArgs: [id],
      );
      if (marketplace.isNotEmpty) {
        return MarketplaceModel.readData(marketplace.first);
      }
    } catch (error) {
      print(error);
    }

    return [].first;
  }

  @override
  Future<int> getCount() async {
    final Database db = await _database();

    try {
      return Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM $MARKETPLACE_TABLE'))!;
    } catch (error) {
      print(error);
    }

    return 0;
  }

  @override
  Future<int?> insert(MarketplaceModel marketplaceModel) async {
    final Database db = await _database();

    try {
      return await db.insert(MARKETPLACE_TABLE, marketplaceModel.writeData());
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> update(MarketplaceModel marketplaceModel) async {
    final Database db = await _database();

    try {
      return await db.update(
        MARKETPLACE_TABLE,
        marketplaceModel.writeData(),
        where: '$MARKETPLACE_COLUMN_ID = ?',
        whereArgs: [marketplaceModel.id],
      );
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> delete(int id) async {
    final Database db = await _database();

    try {
      return await db.delete(
        MARKETPLACE_TABLE,
        where: '$MARKETPLACE_COLUMN_ID = ?',
        whereArgs: [id],
      );
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  void dispose() {}
}
