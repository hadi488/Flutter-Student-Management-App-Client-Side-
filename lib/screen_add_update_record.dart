import 'package:flutter/material.dart';
import 'package:sqflitepractice/model_student.dart';

import 'database_helper.dart';

class ScreenAddUpdateRecord extends StatefulWidget {
  final ModelStudent? modelStudent;
  const ScreenAddUpdateRecord({super.key, required this.modelStudent});

  @override
  State<ScreenAddUpdateRecord> createState() => _ScreenAddUpdateRecordState();
}

class _ScreenAddUpdateRecordState extends State<ScreenAddUpdateRecord> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  DatabaseHelper dbHelper = DatabaseHelper();
  @override
  void initState() {
    super.initState();
    if (widget.modelStudent != null) {
      _nameController.text = widget.modelStudent!.name;
      _fatherNameController.text = widget.modelStudent!.fatherName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.modelStudent == null
            ? Text("Add Record")
            : Text("Update Record"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _fatherNameController,
                decoration: InputDecoration(
                  labelText: "Father Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.family_restroom),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: widget.modelStudent == null
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        onPressed: () {
                          if (_nameController.text.isEmpty ||
                              _fatherNameController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Fields cannot be empty"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                          ModelStudent student = ModelStudent(
                            name: _nameController.text.toString(),
                            fatherName: _fatherNameController.text.toString(),
                          );
                          print(_nameController.text.toString());
                          print(_fatherNameController.text.toString());
                          dbHelper.addStudentRecord(student);
                          Navigator.pop(context);
                        },
                        child: Text("Save", style: TextStyle(fontSize: 18)),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        onPressed: () {
                          if (_nameController.text.isEmpty ||
                              _fatherNameController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Fields cannot be empty"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                          ModelStudent updatedStudent = ModelStudent(
                            id: widget.modelStudent!.id,
                            name: _nameController.text.toString(),
                            fatherName: _fatherNameController.text.toString(),
                          );
                          dbHelper.updateStudentRecord(updatedStudent);
                          Navigator.pop(context);
                        },
                        child: Text("Update", style: TextStyle(fontSize: 18)),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
