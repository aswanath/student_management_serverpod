import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_online_client/student_management_online_client.dart';
import 'package:student_management_online_flutter/bloc/student_bloc.dart';
import 'package:student_management_online_flutter/widgets/baseappbar.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: const BaseAppBar(
        centerTitle: true,
        title: Text("Create"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 5 / 100,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 80 / 100,
                child: TextFieldCustom(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter name";
                    } else {
                      if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\d-]')
                          .hasMatch(value)) {
                        return "please enter a valid name";
                      }
                      return null;
                    }
                  },
                  controller: nameController,
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 100,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 10 / 100,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 35 / 100,
                    child: TextFieldCustom(
                      keyboard: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter age";
                        } else {
                          if (RegExp(r'^\d*$').hasMatch(value) &&
                              int.parse(value) < 150) {
                            return null;
                          } else {
                            return "invalid input";
                          }
                        }
                      },
                      controller: ageController,
                      labelText: 'Age',
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 10 / 100,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 35 / 100,
                    child: TextFieldCustom(
                      keyboard: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter class";
                        } else {
                          if (RegExp(r'^\d*$').hasMatch(value) &&
                              value.length < 3) {
                            return null;
                          } else {
                            return "invalid input";
                          }
                        }
                      },
                      controller: classController,
                      labelText: 'Class',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 100,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 80 / 100,
                child: TextFieldCustom(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter place";
                    }
                    return null;
                  },
                  controller: placeController,
                  labelText: 'Place',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 100,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .1,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .35,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Student student = Student(
                            name: nameController.text,
                            age: int.parse(ageController.text),
                            currentClass: int.parse(classController.text),
                            place: placeController.text,
                          );
                          context
                              .read<StudentBloc>()
                              .add(AddStudentTapped(student: student));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.tealAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .1,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .35,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Back",
                        style:
                            TextStyle(color: Colors.tealAccent, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
