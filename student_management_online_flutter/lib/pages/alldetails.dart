import 'package:flutter/material.dart';
import 'package:student_management_online_client/student_management_online_client.dart';
import 'package:student_management_online_flutter/widgets/baseappbar.dart';


class AllDetails extends StatelessWidget {
  final Student student;

  const AllDetails({Key? key,  required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: const BaseAppBar(
        leadingBack: true,
        title:  Text("Details"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              student.name,
              style: const TextStyle(fontSize: 35, color: Colors.deepOrangeAccent),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const  SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Class : ",style: TextStyle(color: Colors.grey,fontSize: 16),),
                    SizedBox(height: 12,),
                    Text("Age    : ",style: TextStyle(color: Colors.grey,fontSize: 16),),
                    SizedBox(height: 12,),
                    Text("Place : ",style: TextStyle(color: Colors.grey,fontSize: 16),),
                  ],
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(student.currentClass.toString(),
                               style: const TextStyle(fontSize: 22, color: Colors.purple)),
                    const  SizedBox(height: 3,),
                    Text(student.age.toString(),
                            style: const TextStyle(fontSize: 22, color: Colors.purple)),
                    const  SizedBox(height: 3,),
                    Text(student.place,
                               style: const TextStyle(fontSize: 22, color: Colors.purple)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
