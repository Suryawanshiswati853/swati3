class Employee {
  int? EmpId; // Make 'id' nullable

  String EmpName;
  int Age;
  double Salary;

  Employee({
    this.EmpId, // Make 'id' an optional named parameter
    required this.EmpName,
    required this.Age,
    required this.Salary,
  });

  Map<String, dynamic> toMap({bool excludeId = false}) {
    final map = {
      'empName': EmpName,
      'age': Age,
      'salary': Salary,
    };
    if (!excludeId) {
      map['EmpId'] = EmpId!;
    }
    return map;
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      EmpId: map['EmpId'],
      EmpName: map['EmpName'],
      Age: map['Age'],
      Salary: map['Salary'],
    );
  }
}


// class Employee {
//   int? EmpId;
//   String EmpName;
//   int Age;
//   double Salary;

//   Employee({  this.EmpId,  required this.EmpName,  required this.Age, required this.Salary});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': EmpId,
//       'empName': EmpName,
//       'age': Age,
//       'salary': Salary,
//     };
//   }

//   factory Employee.fromMap(Map<String, dynamic> map) {
//     return Employee(
//       EmpId: map['EmpId'],
//       EmpName: map['EmpName'],
//       Age: map['Age'],
//       Salary: map['Salary'],
//     );
//   }
// }
