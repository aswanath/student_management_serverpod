import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_online_client/student_management_online_client.dart';
import 'package:student_management_online_flutter/bloc/student_bloc.dart';
import 'package:student_management_online_flutter/widgets/baseappbar.dart';

class Edit extends StatefulWidget {
  final Student student;
  const Edit({Key? key,required this.student,}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  prefillDetails() {
    Student item = widget.student;
    nameController.text = item.name;
    ageController.text = item.age.toString();
    classController.text = item.currentClass.toString();
    placeController.text = item.place;
  }

  @override
  void initState() {
    prefillDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: const BaseAppBar(
        leadingBack: true,
        centerTitle: true,
        title:  Text("Edit"),
      ),
      body: SingleChildScrollView(
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
                  onChanged: (value) {
                  },
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
                  labelText: 'Name',
                  controller: nameController,
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
                      onChanged: (value) {
                      },
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
                      labelText: 'Age',
                      controller: ageController,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 10 / 100,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 35 / 100,
                    child: TextFieldCustom(
                      keyboard: TextInputType.number,
                      onChanged: (value) {
                      },
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
                      labelText: 'Class',
                      controller: classController,
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
                  onChanged: (value) {
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter place";
                    }
                    return null;
                  },
                  labelText: 'Place',
                  controller: placeController,
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
                             id: widget.student.id,
                              name: nameController.text,
                              age: int.parse(ageController.text),
                              currentClass: int.parse(classController.text),
                              place: placeController.text,
                           );
                           context.read<StudentBloc>().add(UpdateStudentTapped(student: student));
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
                            backgroundColor: Colors.purpleAccent,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Delete"),
                                  content: const Text("Do you want to delete it?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("No")),
                                    TextButton(
                                        onPressed: () {
                                          context.read<StudentBloc>().add(DeleteStudentTapped(id: widget.student.id!));
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child:const  Text("Yes"))
                                  ],
                                );
                              });
                        },
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.tealAccent, fontSize: 16),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
