import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_online_client/student_management_online_client.dart';
import 'package:student_management_online_flutter/bloc/student_bloc.dart';
import 'package:student_management_online_flutter/pages/add.dart';
import 'package:student_management_online_flutter/pages/alldetails.dart';
import 'package:student_management_online_flutter/pages/edit.dart';
import 'dart:io';

import 'package:student_management_online_flutter/widgets/baseappbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IconData? cusIcon;
  String searchText = "";
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: BaseAppBar(
          centerTitle: true,
          title: TextField(
            controller: searchController,
            onChanged: (value) {
              context.read<StudentBloc>().add(FetchStudents(keyWord: value));
            },
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.tealAccent,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.tealAccent,
                ),
              ),
              hintText: "Search",
              hintStyle: TextStyle(
                color: Colors.tealAccent,
              ),
            ),
            style: const TextStyle(color: Colors.tealAccent, fontSize: 20),
          ),
        ),
      ),
      body: BlocConsumer<StudentBloc, StudentState>(
        listener: (context, state) {
          String process = '';
          if (state is StudentAddedSuccess) {
            FocusManager.instance.primaryFocus?.unfocus();
            searchController.text = '';
            process = 'Added';
          } else if (state is StudentUpdateSuccess) {
            FocusManager.instance.primaryFocus?.unfocus();
            searchController.text = '';
            process = 'Edited';
          } else if (state is StudentDeletedSuccess) {
            FocusManager.instance.primaryFocus?.unfocus();
            searchController.text = '';
            process = 'Deleted';
          } else if (state is StudentDetails) {
            if (state.student != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllDetails(
                    student: state.student!,
                  ),
                ),
              );
            }
          }
          if (state is! FetchStudents &&
              state is! StudentDetails &&
              process.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Student $process Successfully")));
          }
        },
        builder: (context, state) {
          if (state is FetchedStudents) {
            if (state.students.isEmpty) {
              return const Center(
                child: Text("The Student List is Empty"),
              );
            } else {
              final List<Student> data = state.students;
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: ListTile(
                          visualDensity: const VisualDensity(vertical: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          tileColor: Colors.white,
                          onTap: () {
                            context
                                .read<StudentBloc>()
                                .add(StudentTapped(id: data[index].id!));
                          },
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Edit(
                                        student: data[index],
                                      ),
                                    ),
                                  );
                                },
                                child: const Icon(Icons.edit),
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Delete"),
                                          content: const Text(
                                              "Do you want to delete it?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("No")),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  BlocProvider.of<StudentBloc>(
                                                          context)
                                                      .add(DeleteStudentTapped(
                                                          id: data[index].id!));
                                                  // context
                                                  //     .read<SearchBloc>()
                                                  //     .add(ClearInput());
                                                },
                                                child: const Text("Yes"))
                                          ],
                                        );
                                      });
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          title: Text(
                            data[index].name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.blue[50],
                      );
                    },
                    itemCount: data.length),
              );
            }
          }
          // else if (state is NoResultsState) {
          //   return const Center(
          //       child: Text(
          //     "No results found",
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          //   ));
          // }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purpleAccent,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Details()));
          },
          child: const Icon(
            Icons.add,
            color: Colors.tealAccent,
          )),
    );
  }
}
