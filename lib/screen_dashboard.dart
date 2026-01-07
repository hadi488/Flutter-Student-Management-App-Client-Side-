import 'package:flutter/material.dart';
import 'package:sqflitepractice/database_helper.dart';
import 'package:sqflitepractice/screen_add_update_record.dart';
import 'package:sqflitepractice/searching_screen.dart';

import 'model_student.dart';

import 'package:sqflitepractice/main.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DatabaseHelper dbHelper = DatabaseHelper();
  List<ModelStudent> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    students = await dbHelper.getAllStudentRecords();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Management System"),
        actions: [
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, value, child) {
              return IconButton(
                onPressed: () {
                  themeNotifier.value = value == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
                },
                icon: Icon(
                  value == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
                ),
              );
            },
          ),
        ],
      ),

      floatingActionButton: Stack(
        children: [
          // Bottom Left Button (Get Records)
          Positioned(
            left: 60,
            bottom: 30,
            child: FloatingActionButton(
              heroTag: "get",
              onPressed: loadStudents,
              child: Icon(Icons.get_app),
            ),
          ),

          // Bottom Right Button (Add Record)
          Positioned(
            right: 30,
            bottom: 30,
            child: FloatingActionButton(
              heroTag: "add",
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ScreenAddUpdateRecord(modelStudent: null),
                  ),
                );
                loadStudents();
              },
              child: Icon(Icons.add),
            ),
          ),
          Positioned(
            left: 195,
            bottom: 30,
            child: FloatingActionButton(
              heroTag: "search",
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchingScreen()),
                );
                loadStudents();
              },
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            // Header removed as ListTile provides a cleaner, self-contained layout

            // List of Students
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  ModelStudent s = students[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 4.0,
                      ),
                      child: ListTile(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ScreenAddUpdateRecord(modelStudent: s),
                            ),
                          );
                          loadStudents();
                        },
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? Colors.cyan.shade700
                              : Colors.cyanAccent,
                          child: Text(
                            s.id.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                        ),
                        title: Text(
                          s.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text("Father: ${s.fatherName}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await dbHelper.deleteStudentRecord(s.id!);
                            loadStudents();
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
