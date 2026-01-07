class ModelStudent {
  int? id;
  String name;
  String fatherName;

  ModelStudent({this.id, required this.name, required this.fatherName});

  factory ModelStudent.fromMap(Map<String, dynamic> map) {
    return ModelStudent(
      id: map['id'],
      name: map['name'],
      fatherName: map['father_name'],
    );
  }
  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'father_name': fatherName,
  };
}
