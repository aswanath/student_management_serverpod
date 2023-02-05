import 'package:student_management_online_client/student_management_online_client.dart';
import 'package:student_management_online_flutter/main.dart';

class StudentRepository {
  final studentEndpoint = client.studentEndPoint;

  Future<List<Student>> getStudents({String? keyWord}) async {
    return await studentEndpoint.getStudents(keyWord:keyWord);
  }

  Future<Student> create(Student student) async {
    return await studentEndpoint.create(student);
  }

  Future<bool> update(Student student) async {
    return await studentEndpoint.update(student);
  }

  Future<void> delete(int id) async {
    await studentEndpoint.delete(id);
  }

  Future<Student?> get(int id) async {
    return await studentEndpoint.get(id);
  }
}
