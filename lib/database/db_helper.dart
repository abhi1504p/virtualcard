import 'package:path/path.dart' as P;
import 'package:sqflite/sqflite.dart';
import 'package:virtualcard/models/contact_model.dart';

class DbHelper {
  final String _createTableContact = ''' create table $tableContact(
  $tableContactColId integer primary key autoincrement,
  $tableContactColName text,
  $tableContactColMobile text,
  $tableContactColEmail text,
   $tableContactColAddress text, 
   $tableContactColWebsite text, $tableContactColCompany text, $tableContactColDesignation text, $tableContactColFavorite text,$tableContactColImage text)''';

  Future<Database> _open() async {
    final root = await getDatabasesPath();
    final dbPath = P.join(root, "contact.db");
    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(_createTableContact);
    });
  }
}
