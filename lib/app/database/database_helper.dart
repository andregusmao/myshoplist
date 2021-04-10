import 'package:myshoplist/app/constants/marketplace_constants.dart';
import 'package:myshoplist/app/constants/product_constants.dart';
import 'package:myshoplist/app/constants/shoplist_constants.dart';
import 'package:myshoplist/app/constants/shoplist_item_constants.dart';
import 'package:myshoplist/app/constants/purchase_constants.dart';
import 'package:myshoplist/app/constants/purchase_item_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myshoplist/app/database/database_helper_enum.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static _initDatabase() async {
    try {
      String path = join(
          await getDatabasesPath(), DatabaseHelperEnum.getValue(DATABASE.name));
      await deleteDatabase(path);
      return await openDatabase(path,
          version: DatabaseHelperEnum.getValue(DATABASE.version),
          onCreate: _onCreate,
          onConfigure: _onConfigure);
    } catch (error) {
      print(error);
    }
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
    print('Foreign keys turned on');
  }

  static Future _onCreate(Database db, int version) async {
    List<String> sql = [
      '''DROP TABLE IF EXISTS $PURCHASE_ITEM_TABLE;''',
      '''DROP TABLE IF EXISTS $PURCHASE_TABLE;''',
      '''DROP TABLE IF EXISTS $SHOPLIST_ITEM_TABLE;''',
      '''DROP TABLE IF EXISTS $SHOPLIST_TABLE;''',
      '''DROP TABLE IF EXISTS $PRODUCT_TABLE;''',
      '''DROP TABLE IF EXISTS $MARKETPLACE_TABLE;''',
      '''PRAGMA foreign_keys = ON;''',
      '''CREATE TABLE $MARKETPLACE_TABLE (
          $MARKETPLACE_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $MARKETPLACE_COLUMN_NAME TEXT NOT NULL,
          $MARKETPLACE_COLUMN_ADDRESS TEXT,
          $MARKETPLACE_COLUMN_LATITUDE TEXT,
          $MARKETPLACE_COLUMN_LONGITUDE TEXT,
          $MARKETPLACE_COLUMN_CREATE_DATE DATETIME NOT NULL,
          $MARKETPLACE_COLUMN_UPDATE_DATE DATETIME
      );''',
      '''CREATE TABLE $PRODUCT_TABLE (
          $PRODUCT_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $PRODUCT_COLUMN_BARCODE TEXT NOT NULL,
          $PRODUCT_COLUMN_DESCRIPTION TEXT NOT NULL,
          $PRODUCT_COLUMN_BRAND TEXT,
          $PRODUCT_COLUMN_UNIT TEXT NOT NULL,
          $PRODUCT_COLUMN_WEIGHT DOUBLE,
          $PRODUCT_COLUMN_CREATE_DATE DATETIME NOT NULL,
          $PRODUCT_COLUMN_UPDATE_DATE DATETIME
      );''',
      '''CREATE TABLE $SHOPLIST_TABLE (
          $SHOPLIST_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $SHOPLIST_COLUMN_NAME TEXT NOT NULL,
          $SHOPLIST_COLUMN_CREATE_DATE DATETIME NOT NULL,
          $SHOPLIST_COLUMN_UPDATE_DATE DATETIME
      );''',
      '''CREATE TABLE $SHOPLIST_ITEM_TABLE (
          $SHOPLIST_ITEM_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $SHOPLIST_ITEM_COLUMN_SHOPLIST_ID INTEGER NOT NULL,
          $SHOPLIST_ITEM_COLUMN_PRODUCT_ID INTEGER NOT NULL,
          $SHOPLIST_ITEM_COLUMN_QUANTITY INTEGER NOT NULL,
          $SHOPLIST_ITEM_COLUMN_CREATE_DATE DATETIME NOT NULL,
          $SHOPLIST_ITEM_COLUMN_UPDATE_DATE DATETIME,
          FOREIGN KEY($SHOPLIST_ITEM_COLUMN_SHOPLIST_ID) REFERENCES $SHOPLIST_TABLE($SHOPLIST_COLUMN_ID),
          FOREIGN KEY($SHOPLIST_ITEM_COLUMN_PRODUCT_ID) REFERENCES $PRODUCT_TABLE($PRODUCT_COLUMN_ID)
      );''',
      '''CREATE TABLE $PURCHASE_TABLE (
          $PURCHASE_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $PURCHASE_COLUMN_SHOPLIST_ID INTEGER NOT NULL,
          $PURCHASE_COLUMN_MARKETPLACE_ID INTEGER NOT NULL,
          $PURCHASE_COLUMN_START_DATE DATETIME NOT NULL,
          $PURCHASE_COLUMN_FINISH_DATE DATETIME,
          FOREIGN KEY($PURCHASE_COLUMN_SHOPLIST_ID) REFERENCES $SHOPLIST_TABLE($SHOPLIST_COLUMN_ID),
          FOREIGN KEY($PURCHASE_COLUMN_MARKETPLACE_ID) REFERENCES $MARKETPLACE_TABLE($MARKETPLACE_COLUMN_ID)
      );''',
      '''CREATE TABLE $PURCHASE_ITEM_TABLE (
          $PURCHASE_ITEM_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $PURCHASE_ITEM_COLUMN_PURCHASE_ID INTEGER NOT NULL,
          $PURCHASE_ITEM_COLUMN_PRODUCT_ID INTEGER NOT NULL,
          $PURCHASE_ITEM_COLUMN_QUANTITY INTEGER NOT NULL,
          $PURCHASE_ITEM_COLUMN_UNIT_PRICE DOUBLE NOT NULL,
          $PURCHASE_ITEM_COLUMN_CREATE_DATE DATETIME NOT NULL,
          $PURCHASE_ITEM_COLUMN_UPDATE_DATE DATETIME,
          FOREIGN KEY($PURCHASE_ITEM_COLUMN_PURCHASE_ID) REFERENCES $PURCHASE_TABLE($PURCHASE_COLUMN_ID),
          FOREIGN KEY($PURCHASE_ITEM_COLUMN_PRODUCT_ID) REFERENCES $PRODUCT_TABLE($PRODUCT_COLUMN_ID)
      );''',
    ];

    for (var i = 0; i < sql.length; i++) {
      print("execute sql : " + sql[i]);
      await db.execute(sql[i]).catchError((onError) => print(onError));
    }
  }
}
