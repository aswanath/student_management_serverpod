part of 'student_bloc.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}
class StudentUpdateSuccess extends StudentState {}
class StudentDeletedSuccess extends StudentState {}
class StudentAddedSuccess extends StudentState {}

class FetchedStudents extends StudentState {
  final List<Student> students;

  FetchedStudents({required this.students});
}

class StudentDetails extends StudentState {
  final Student? student;

  StudentDetails({required this.student});
}
