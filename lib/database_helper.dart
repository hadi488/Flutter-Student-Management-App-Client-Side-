import 'package:path/path.dart' as JoinPath;
import 'package:sqflite/sqflite.dart';
import 'package:sqflitepractice/model_student.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  final String studentTable = "student";
  factory DatabaseHelper() {
    _instance == null ? _instance = DatabaseHelper._interanl() : _instance!;
    return _instance!;
  }

  DatabaseHelper._interanl();

  static Database? _database;
  Future<Database> get database async {
    if (_database == null) {
      String _path = await getDatabasesPath();
      String _fulldbpath = JoinPath.join(_path, "student_db.db");
      _database = await openDatabase(
        _fulldbpath,
        version: 1,
        onCreate: (Database db, int version) async {
          final String studentTableQuery =
              '''
            CREATE TABLE $studentTable(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT not null,
              father_name TEXT not null
            )
          ''';
          await db.execute(studentTableQuery);
        },
      );
      return _database!;
    } else {
      return _database!;
    }
  }

  Future<bool> addStudentRecord(ModelStudent std) async {
    Map<String, dynamic> stdmap = std.toMap();
    try {
      Database db = await database;
      await db.insert(studentTable, stdmap);
      print("Student record added successfully.");
      print(db.path.toString());
      return true;
    } catch (e) {
      print("Error in AddStudentRecord: $e");
      return false;
    }
  }

  Future<List<ModelStudent>> getAllStudentRecords() async {
    List<ModelStudent> students = [];
    try {
      Database db = await database;
      List<Map<String, dynamic>> result = await db.query(studentTable);
      students = result.map((e) => ModelStudent.fromMap(e)).toList();
      print('Total records found: ${students.length}');
      return students;
    } catch (e) {
      print("Error in GetAllStudentRecords: $e");
      return students;
    }
  }

  Future<List<ModelStudent>> searchStudents({
    String? name,
    String? fatherName,
    int? id,
  }) async {
    try {
      Database db = await database;
      List<String> whereClauses = [];
      List<dynamic> whereArgs = [];

      if (id != null) {
        whereClauses.add("id = ?");
        whereArgs.add(id);
      }
      if (name != null && name.isNotEmpty) {
        whereClauses.add("name LIKE ?");
        whereArgs.add("$name%");
      }
      if (fatherName != null && fatherName.isNotEmpty) {
        whereClauses.add("father_name LIKE ?");
        whereArgs.add("$fatherName%");
      }

      String whereString = whereClauses.join(" AND ");

      List<Map<String, dynamic>> result = await db.query(
        studentTable,
        where: whereString.isNotEmpty ? whereString : null,
        whereArgs: whereArgs.isNotEmpty ? whereArgs : null,
      );

      return result.map((e) => ModelStudent.fromMap(e)).toList();
    } catch (e) {
      print("Error in SearchStudents: $e");
      return [];
    }
  }

  Future<bool> updateStudentRecord(ModelStudent std) async {
    Map<String, dynamic> stdmap = std.toMap();
    try {
      Database db = await database;
      await db.update(
        studentTable,
        stdmap,
        where: "id = ?",
        whereArgs: [stdmap['id']],
      );
      return true;
    } catch (e) {
      print("Error in UpdateStudentRecord: $e");
      return false;
    }
  }

  Future<bool> deleteStudentRecord(int id) async {
    try {
      Database db = await database;
      await db.delete(studentTable, where: "id = ?", whereArgs: [id]);
      return true;
    } catch (e) {
      print("Error in DeleteStudentRecord: $e");
      return false;
    }
  }
}
