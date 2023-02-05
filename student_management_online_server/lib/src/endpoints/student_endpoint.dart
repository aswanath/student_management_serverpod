import 'package:serverpod/database.dart';
import 'package:serverpod/server.dart';
import 'package:student_management_online_server/src/generated/student.dart';

class StudentEndPoint extends Endpoint {
  Future<List<Student>> getStudents(Session session, {String? keyWord}) async {
    return await Student.find(
      session,
      where: (StudentTable table) =>
          keyWord != null ? table.name.ilike("%$keyWord%") : Constant(true),
    );
  }

  Future<Student> create(Session session, Student student) async {
    await Student.insert(session, student);
    return student;
  }

  Future<bool> update(Session session, Student student) async {
    return await Student.update(session, student);
  }

  Future<void> delete(Session session, int id) async {
    await Student.delete(session,
        where: (StudentTable table) => table.id.equals(id));
  }

  Future<Student?> get(Session session, int id) async {
    return await Student.findById(session, id);
  }
}
