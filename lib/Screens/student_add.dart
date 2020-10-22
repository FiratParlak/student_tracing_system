//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_name/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;

  /*StudentAdd(List<Student> students) {
    this.students = students;
  }*/

  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  Student student = new Student("", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ögrenci"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirtNameField(),
              buildlastNameField(),
              buildGradeField(),
              builtSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  buildFirtNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ögrenci Adı", hintText: "Fırat"),
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  buildlastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Ögrenci Soyadı", hintText: "Parlak"),
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldıgı Notu", hintText: "80"),
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget builtSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        formKey.currentState.save();
        print(student.firstName);
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }
}
