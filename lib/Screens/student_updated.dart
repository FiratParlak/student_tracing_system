//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_name/main.dart';
import 'package:flutter_name/models/student.dart';

class StudentUpdated extends StatefulWidget {
  List<Student> students;
  int selectedIndex;

  /*StudentAdd(List<Student> students) {
    this.students = students;
  }*/

  StudentUpdated(this.students, this.selectedIndex);

  @override
  State<StatefulWidget> createState() {
    return _StudentUpdatedState();
  }
}

class _StudentUpdatedState extends State<StudentUpdated> {
  var formKey = GlobalKey<FormState>();
  Student student = new Student("", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ögrenci Güncelle"),
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
      decoration: InputDecoration(labelText: "Ögrenci Adı"),
      initialValue: widget.students[widget.selectedIndex].firstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  buildlastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ögrenci Soyadı"),
      initialValue: widget.students[widget.selectedIndex].lastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldıgı Notu"),
      initialValue: widget.students[widget.selectedIndex].grade.toString(),
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
        widget.students.removeAt(selectedIndex);
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }
}
