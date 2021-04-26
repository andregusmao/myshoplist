import 'package:myshoplist/constants/purchase_item_constants.dart';
import 'package:myshoplist/models/purchase_item_model.dart';
import 'package:myshoplist/repositories/product_repository.dart';
import 'package:myshoplist/repositories/purchase_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myshoplist/database/database_helper.dart';
import 'interfaces/purchase_item_repository_interface.dart';

class PurchaseItemRepository extends Disposable
    implements IPurchaseItemRepository {
  Future<Database> _database() => DatabaseHelper.instance.database;

  @override
  Future<List<PurchaseItemModel>> getAll(int purchaseId) async {
    final Database db = await _database();
    try {
      final purchaseItems = await db.query(PURCHASE_ITEM_TABLE,
          where: '$PURCHASE_ITEM_COLUMN_PURCHASE_ID = ?',
          whereArgs: [purchaseId]);
      List<PurchaseItemModel> list = [];
      for (Map<String, Object?> purchaseItem in purchaseItems) {
        list.add(PurchaseItemModel(
          id: purchaseItem[PURCHASE_ITEM_COLUMN_ID] as int,
          purchaseId: purchaseItem[PURCHASE_ITEM_COLUMN_PURCHASE_ID] as int,
          productId: purchaseItem[PURCHASE_ITEM_COLUMN_PRODUCT_ID] as int,
          quantity: purchaseItem[PURCHASE_ITEM_COLUMN_QUANTITY] as double,
          unitPrice: purchaseItem[PURCHASE_ITEM_COLUMN_UNIT_PRICE] as double,
          createdAt: DateTime.parse(
              purchaseItem[PURCHASE_ITEM_COLUMN_CREATE_DATE].toString()),
          updatedAt: DateTime.tryParse(
              purchaseItem[PURCHASE_ITEM_COLUMN_UPDATE_DATE].toString()),
          purchase: await PurchaseRepository()
              .getById(purchaseItem[PURCHASE_ITEM_COLUMN_PURCHASE_ID] as int),
          product: await ProductRepository()
              .getById(purchaseItem[PURCHASE_ITEM_COLUMN_PRODUCT_ID] as int),
        ));
      }
      return list;
    } catch (error) {
      print(error);
    }

    return [];
  }

  @override
  Future<PurchaseItemModel> getById(int id) async {
    final Database db = await _database();

    try {
      List<Map<String, dynamic>> purchaseItem = await db.query(
        PURCHASE_ITEM_TABLE,
        columns: [
          PURCHASE_ITEM_COLUMN_ID,
          PURCHASE_ITEM_COLUMN_PURCHASE_ID,
          PURCHASE_ITEM_COLUMN_PRODUCT_ID,
          PURCHASE_ITEM_COLUMN_QUANTITY,
          PURCHASE_ITEM_COLUMN_UNIT_PRICE,
          PURCHASE_ITEM_COLUMN_CREATE_DATE,
          PURCHASE_ITEM_COLUMN_UPDATE_DATE,
        ],
        where: '$PURCHASE_ITEM_COLUMN_ID = ?',
        whereArgs: [id],
      );
      if (purchaseItem.isNotEmpty) {
        return PurchaseItemModel.fromMap(purchaseItem.first);
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
          await db.rawQuery('SELECT COUNT(*) FROM $PURCHASE_ITEM_TABLE'))!;
    } catch (error) {
      print(error);
    }

    return 0;
  }

  @override
  Future<int?> insert(PurchaseItemModel purchaseItemModel) async {
    final Database db = await _database();

    try {
      return await db.insert(PURCHASE_ITEM_TABLE, purchaseItemModel.toMap());
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Future<int?> update(PurchaseItemModel purchaseItemModel) async {
    final Database db = await _database();

    try {
      return await db.update(
        PURCHASE_ITEM_TABLE,
        purchaseItemModel.toMap(),
        where: '$PURCHASE_ITEM_COLUMN_ID = ?',
        whereArgs: [purchaseItemModel.id],
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
        PURCHASE_ITEM_TABLE,
        where: '$PURCHASE_ITEM_COLUMN_ID = ?',
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
