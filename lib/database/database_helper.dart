import 'package:myshoplist/constants/marketplace_constants.dart';
import 'package:myshoplist/constants/product_constants.dart';
import 'package:myshoplist/constants/shoplist_constants.dart';
import 'package:myshoplist/constants/shoplist_item_constants.dart';
import 'package:myshoplist/constants/purchase_constants.dart';
import 'package:myshoplist/constants/purchase_item_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myshoplist/database/database_helper_enum.dart';

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
      return await openDatabase(path,
          version: DatabaseHelperEnum.getValue(DATABASE.version),
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
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
      '''CREATE TABLE IF NOT EXISTS $MARKETPLACE_TABLE (
          $MARKETPLACE_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $MARKETPLACE_COLUMN_NAME TEXT NOT NULL,
          $MARKETPLACE_COLUMN_ADDRESS TEXT,
          $MARKETPLACE_COLUMN_LATITUDE TEXT,
          $MARKETPLACE_COLUMN_LONGITUDE TEXT,
          $MARKETPLACE_COLUMN_CREATE_DATE TEXT NOT NULL,
          $MARKETPLACE_COLUMN_UPDATE_DATE TEXT
      );''',
      '''CREATE TABLE IF NOT EXISTS $PRODUCT_TABLE (
          $PRODUCT_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $PRODUCT_COLUMN_BARCODE TEXT NOT NULL,
          $PRODUCT_COLUMN_DESCRIPTION TEXT NOT NULL,
          $PRODUCT_COLUMN_BRAND TEXT,
          $PRODUCT_COLUMN_PACKING TEXT NOT NULL,
          $PRODUCT_COLUMN_WEIGHT DOUBLE NOT NULL,
          $PRODUCT_COLUMN_UNIT TEXT NOT NULL,
          $PRODUCT_COLUMN_IMAGE BLOB,
          $PRODUCT_COLUMN_CREATE_DATE TEXT NOT NULL,
          $PRODUCT_COLUMN_UPDATE_DATE TEXT
      );''',
      '''CREATE TABLE IF NOT EXISTS $SHOPLIST_TABLE (
          $SHOPLIST_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $SHOPLIST_COLUMN_NAME TEXT NOT NULL,
          $SHOPLIST_COLUMN_CREATE_DATE TEXT NOT NULL,
          $SHOPLIST_COLUMN_UPDATE_DATE TEXT
      );''',
      '''CREATE TABLE IF NOT EXISTS $SHOPLIST_ITEM_TABLE (
          $SHOPLIST_ITEM_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $SHOPLIST_ITEM_COLUMN_SHOPLIST_ID INTEGER NOT NULL,
          $SHOPLIST_ITEM_COLUMN_PRODUCT_ID INTEGER NOT NULL,
          $SHOPLIST_ITEM_COLUMN_QUANTITY DOUBLE NOT NULL,
          $SHOPLIST_ITEM_COLUMN_CREATE_DATE TEXT NOT NULL,
          $SHOPLIST_ITEM_COLUMN_UPDATE_DATE TEXT,
          FOREIGN KEY($SHOPLIST_ITEM_COLUMN_SHOPLIST_ID) REFERENCES $SHOPLIST_TABLE($SHOPLIST_COLUMN_ID),
          FOREIGN KEY($SHOPLIST_ITEM_COLUMN_PRODUCT_ID) REFERENCES $PRODUCT_TABLE($PRODUCT_COLUMN_ID)
      );''',
      '''CREATE TABLE IF NOT EXISTS $PURCHASE_TABLE (
          $PURCHASE_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $PURCHASE_COLUMN_SHOPLIST_ID INTEGER NOT NULL,
          $PURCHASE_COLUMN_MARKETPLACE_ID INTEGER NOT NULL,
          $PURCHASE_COLUMN_START_DATE TEXT,
          $PURCHASE_COLUMN_FINISH_DATE TEXT,
          $PURCHASE_COLUMN_CREATE_DATE TEXT NOT NULL,
          $PURCHASE_COLUMN_UPDATE_DATE TEXT,
          FOREIGN KEY($PURCHASE_COLUMN_SHOPLIST_ID) REFERENCES $SHOPLIST_TABLE($SHOPLIST_COLUMN_ID),
          FOREIGN KEY($PURCHASE_COLUMN_MARKETPLACE_ID) REFERENCES $MARKETPLACE_TABLE($MARKETPLACE_COLUMN_ID)
      );''',
      '''CREATE TABLE IF NOT EXISTS $PURCHASE_ITEM_TABLE (
          $PURCHASE_ITEM_COLUMN_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          $PURCHASE_ITEM_COLUMN_PURCHASE_ID INTEGER NOT NULL,
          $PURCHASE_ITEM_COLUMN_PRODUCT_ID INTEGER NOT NULL,
          $PURCHASE_ITEM_COLUMN_QUANTITY INTEGER NOT NULL,
          $PURCHASE_ITEM_COLUMN_UNIT_PRICE DOUBLE NOT NULL,
          $PURCHASE_ITEM_COLUMN_CREATE_DATE TEXT NOT NULL,
          $PURCHASE_ITEM_COLUMN_UPDATE_DATE TEXT,
          FOREIGN KEY($PURCHASE_ITEM_COLUMN_PURCHASE_ID) REFERENCES $PURCHASE_TABLE($PURCHASE_COLUMN_ID),
          FOREIGN KEY($PURCHASE_ITEM_COLUMN_PRODUCT_ID) REFERENCES $PRODUCT_TABLE($PRODUCT_COLUMN_ID)
      );''',
    ];

    for (var i = 0; i < sql.length; i++) {
      print("execute sql : " + sql[i]);
      await db.execute(sql[i]).catchError((onError) => print(onError));
    }
  }

  static Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    List<String> sql = [
      '''DROP TABLE IF EXISTS $PURCHASE_ITEM_TABLE;''',
      '''DROP TABLE IF EXISTS $PURCHASE_TABLE;''',
      '''DROP TABLE IF EXISTS $SHOPLIST_ITEM_TABLE;''',
      '''DROP TABLE IF EXISTS $SHOPLIST_TABLE;''',
      '''DROP TABLE IF EXISTS $PRODUCT_TABLE;''',
      '''DROP TABLE IF EXISTS $MARKETPLACE_TABLE;''',
    ];

    for (var i = 0; i < sql.length; i++) {
      print("execute sql : " + sql[i]);
      await db.execute(sql[i]).catchError((onError) => print(onError));
    }
  }
}
