import 'package:flutter/material.dart';
import 'package:flutter_name/Screens/student_add.dart';
import 'package:flutter_name/Screens/student_updated.dart';
import 'package:flutter_name/models/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

Student selectedStudent = Student.withid(0, "", "", 0);
int selectedIndex;

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withid(1, "Fırat", "Parlak", 95),
    Student.withid(2, "Esra", "Kalkavan", 30)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ögrenci Takip Sistemi"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(children: <Widget>[
      Expanded(
        child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                    students[index].firstName + " " + students[index].lastName),
                subtitle: Text("Sınavdan aldığı not : " +
                    students[index].grade.toString() +
                    "[" +
                    students[index].getStatus() +
                    "]"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://1.bp.blogspot.com/-Vg16yzr6gik/XAKnw7yiKMI/AAAAAAAANoo/Bj11ov3KV3QpICBDS88D97bNugNzQr3VACLcBGAs/s1600/whatsapprofilresimleri%2B%25281%2529.jpg"),
                ),
                trailing: buildStatusIcon(students[index].grade),
                onTap: () {
                  setState(() {
                    selectedStudent = students[index];
                    selectedIndex = index;
                  });
                },
              );
            }),
      ),
      Text("Seçili Ögrenci " + selectedStudent.firstName),
      Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: RaisedButton(
              color: Colors.greenAccent,
              child: Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Yeni Ögrenci")
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentAdd(students)),
                ).then((value) => setState(() {}));
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentAdd(students)));*/
                print("Yeni Ögrenci");
              },
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: RaisedButton(
              color: Colors.black12,
              child: Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Güncelle")
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          StudentUpdated(students, selectedIndex)),
                ).then((value) => setState(() {}));
              },
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              color: Colors.amberAccent,
              child: Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Sil")
                ],
              ),
              onPressed: () {
                setState(() {
                  students.removeAt(selectedIndex);
                  print("Id : " + selectedIndex.toString());
                  print("Sil");
                });
              },
            ),
          )
        ],
      )
    ]);
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
