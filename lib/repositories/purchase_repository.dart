import 'package:myshoplist/repositories/marketplace_repository.dart';
import 'package:myshoplist/repositories/purchase_item_repository.dart';
import 'package:myshoplist/repositories/shoplist_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/constants/purchase_constants.dart';
import 'package:myshoplist/database/database_helper.dart';
import 'package:myshoplist/models/purchase_model.dart';
import 'package:myshoplist/repositories/interfaces/purchase_repository_interface.dart';

class PurchaseRepository extends Disposable implements IPurchaseRepository {
  Future<Database> _database() => DatabaseHelper.instance.database;

  @override
  Future<List<PurchaseModel>> getAll() async {
    final Database db = await _database();
    try {
      final purchases = await db.query(PURCHASE_TABLE);
      List<PurchaseModel> list = [];
      for (Map<String, Object?> purchase in purchases) {
        list.add(PurchaseModel(
            id: purchase[PURCHASE_COLUMN_ID] as int,
            shoplistId: purchase[PURCHASE_COLUMN_SHOPLIST_ID] as int,
            marketplaceId: purchase[PURCHASE_COLUMN_MARKETPLACE_ID] as int,
            startDate: DateTime.tryParse(
                purchase[PURCHASE_COLUMN_START_DATE].toString()),
            finishDate: DateTime.tryParse(
                purchase[PURCHASE_COLUMN_FINISH_DATE].toString()),
            createdAt: DateTime.parse(
                purchase[PURCHASE_COLUMN_CREATE_DATE].toString()),
            updatedAt: DateTime.tryParse(
                purchase[PURCHASE_COLUMN_UPDATE_DATE].toString()),
            items: [],
            shoplist: await ShoplistRepository()
                .getById(purchase[PURCHASE_COLUMN_SHOPLIST_ID] as int),
            marketplace: await MarketplaceRepository()
                .getById(purchase[PURCHASE_COLUMN_MARKETPLACE_ID] as int)));
      }
      return list;
    } catch (error) {
      print(error);
    }

    return [];
  }

  @override
  Future<PurchaseModel> getById(int id) async {
    final Database db = await _database();

    try {
      List<Map<String, dynamic>> purchase = await db.query(
        PURCHASE_TABLE,
        columns: [
          PURCHASE_COLUMN_ID,
          PURCHASE_COLUMN_SHOPLIST_ID,
          PURCHASE_COLUMN_MARKETPLACE_ID,
          PURCHASE_COLUMN_START_DATE,
          PURCHASE_COLUMN_FINISH_DATE,
        ],
        where: '$PURCHASE_COLUMN_ID = ?',
        whereArgs: [id],
        limit: 1,
      );
      if (purchase.isNotEmpty) {
        purchase.first['item'] = await PurchaseItemRepository().getAll(id);
        return PurchaseModel.fromMap(purchase.first);
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
          await db.rawQuery('SELECT COUNT(*) FROM $PURCHASE_TABLE'))!;
    } catch (error) {
      print(error);
    }

    return 0;
  }

  @override
  Future<int?> insert(PurchaseModel purchaseModel) async {
    final Database db = await _database();

    try {
      return await db.insert(PURCHASE_TABLE, purchaseModel.toMap());
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> update(PurchaseModel purchaseModel) async {
    final Database db = await _database();

    try {
      return await db.update(
        PURCHASE_TABLE,
        purchaseModel.toMap(),
        where: '$PURCHASE_COLUMN_ID = ?',
        whereArgs: [purchaseModel.id],
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
        PURCHASE_TABLE,
        where: '$PURCHASE_COLUMN_ID = ?',
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
