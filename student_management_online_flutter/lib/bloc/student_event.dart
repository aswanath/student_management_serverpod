part of 'student_bloc.dart';

@immutable
abstract class StudentEvent {}

class FetchStudents extends StudentEvent {
  final String? keyWord;
  FetchStudents({this.keyWord});
}

class StudentTapped extends StudentEvent {
  final int id;

  StudentTapped({required this.id});
}

class UpdateStudentTapped extends StudentEvent {
  final Student student;

  UpdateStudentTapped({required this.student});
}

class AddStudentTapped extends StudentEvent {
  final Student student;

  AddStudentTapped({required this.student});
}

class DeleteStudentTapped extends StudentEvent {
  final int id;

  DeleteStudentTapped({required this.id});
}