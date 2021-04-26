enum DATABASE { name, version }

class DatabaseHelperEnum {
  static dynamic getValue(DATABASE databaseName) {
    switch (databaseName) {
      case DATABASE.name:
        return "myshoplist.db";
      case DATABASE.version:
        return 1;
      default:
        return null;
    }
  }
}
