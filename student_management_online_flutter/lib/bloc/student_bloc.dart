import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_online_client/student_management_online_client.dart';
import 'package:student_management_online_flutter/repository/student_repository.dart';

part 'student_event.dart';

part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository studentRepository;

  StudentBloc(this.studentRepository) : super(StudentInitial()) {
    on<FetchStudents>(_onFetchStudents);
    on<StudentTapped>(_onStudentTapped);
    on<UpdateStudentTapped>(_onUpdateStudentTapped);
    on<DeleteStudentTapped>(_onDeleteStudentTapped);
    on<AddStudentTapped>(_onAddStudentTapped);
  }

  FutureOr<void> _onDeleteStudentTapped(DeleteStudentTapped event, emit) async {
    await studentRepository.delete(event.id);
    emit(StudentDeletedSuccess());
    add(FetchStudents());
  }

  FutureOr<void> _onAddStudentTapped(AddStudentTapped event, emit) async {
    await studentRepository.create(event.student);
    emit(StudentAddedSuccess());
    add(FetchStudents());
  }

  FutureOr<void> _onUpdateStudentTapped(UpdateStudentTapped event, emit) async {
    var isUpdated = await studentRepository.update(event.student);
    if(isUpdated) {
      emit(StudentUpdateSuccess());
      add(FetchStudents());
    }
  }

  FutureOr<void> _onStudentTapped(StudentTapped event, emit) async {
    var student = await studentRepository.get(event.id);
    emit(StudentDetails(student: student));
  }

  FutureOr<void> _onFetchStudents(FetchStudents event, emit) async {
    var students = await studentRepository.getStudents(keyWord: event.keyWord);
    emit(FetchedStudents(students: students));
  }
}
