/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Student extends _i1.TableRow {
  Student({
    int? id,
    required this.name,
    required this.age,
    required this.currentClass,
    required this.place,
  }) : super(id);

  factory Student.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Student(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      age: serializationManager.deserialize<int>(jsonSerialization['age']),
      currentClass: serializationManager
          .deserialize<int>(jsonSerialization['currentClass']),
      place:
          serializationManager.deserialize<String>(jsonSerialization['place']),
    );
  }

  static final t = StudentTable();

  String name;

  int age;

  int currentClass;

  String place;

  @override
  String get tableName => 'student';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'currentClass': currentClass,
      'place': place,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'currentClass': currentClass,
      'place': place,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'currentClass': currentClass,
      'place': place,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
      case 'age':
        age = value;
        return;
      case 'currentClass':
        currentClass = value;
        return;
      case 'place':
        place = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Student>> find(
    _i1.Session session, {
    StudentExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Student>(
      where: where != null ? where(Student.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Student?> findSingleRow(
    _i1.Session session, {
    StudentExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Student>(
      where: where != null ? where(Student.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Student?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Student>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required StudentExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Student>(
      where: where(Student.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Student row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Student row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Student row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    StudentExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Student>(
      where: where != null ? where(Student.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef StudentExpressionBuilder = _i1.Expression Function(StudentTable);

class StudentTable extends _i1.Table {
  StudentTable() : super(tableName: 'student');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final age = _i1.ColumnInt('age');

  final currentClass = _i1.ColumnInt('currentClass');

  final place = _i1.ColumnString('place');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        age,
        currentClass,
        place,
      ];
}

@Deprecated('Use StudentTable.t instead.')
StudentTable tStudent = StudentTable();
