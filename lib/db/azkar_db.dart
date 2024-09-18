// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class AzkarDb {
  dynamic requestSqlDataAsync() async {
    // call API/await function to get the data

    var databasesPath = await getDatabasesPath();

    var path = join(databasesPath, "Azkar.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data =
          await rootBundle.load(url.join("assets", "db", "azkar-db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {}

// open the database
    var db = await openDatabase(path, readOnly: true);
    // openReadOnlyDatabase("assets/azkar-db");
    return db;
  }

  dynamic getAzkar() async {
    var db = await requestSqlDataAsync();
    var _list = await db.rawQuery(
        "Select category.cat_name as cat_name, alarms.cat_name as has_alarm, time_hr,time_mn from category left outer join alarms on category.cat_name = alarms.cat_name");
    //.query('category', columns: ["cat_name"]);
    return _list;
  }

  dynamic getZekr(catName) async {
    var db = await requestSqlDataAsync();
    var _list =
        await db.rawQuery("Select * from azkar where category = '$catName'");
    //.query('category', columns: ["cat_name"]);
    return _list;
  }
}
