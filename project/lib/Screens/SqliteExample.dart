import 'package:flutter/material.dart';
import 'package:project/Model/Employees.dart';
import 'package:project/dbHelper/sqliteDatabase.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';




class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _empNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  List<Employee> employees = [];

  @override
  void initState() {
    super.initState();
    _fetchEmployees();
  }

  void _fetchEmployees() async {
    final fetchedEmployees = await dbHelper.getAllEmployees();
    setState(() {
      employees = fetchedEmployees;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Database App'),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _empNameController,
                  decoration: InputDecoration(labelText: 'Employee Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Employee Name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Age';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _salaryController,
                  decoration: InputDecoration(labelText: 'Salary'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Salary';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final employee = Employee(
                  EmpName: _empNameController.text,
                  Age: int.parse(_ageController.text),
                  Salary: double.parse(_salaryController.text),
                );

                final result = await dbHelper.insertEmployee(employee);

                if (result != null && result > 0) {
                  Fluttertoast.showToast(
                    msg: 'Employee added successfully',
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                  _clearFields();
                  _fetchEmployees(); // Refresh the employee list
                } else {
                  Fluttertoast.showToast(
                    msg: 'Failed to add employee',
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }
              }
            },
            child: Text('Insert Employee'),
          ),
           ElevatedButton(
            onPressed: () {
              _fetchEmployees(); // Refresh the employee list
            },
            child: Text('Refresh Employee List'), // Add this button
          ),
          Expanded(
            child: ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return ListTile(
                  title: Text('Employee Name: ${employee.EmpName}'),
                  subtitle: Text('Age: ${employee.Age}, Salary: ${employee.Salary}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _clearFields() {
    _empNameController.clear();
    _ageController.clear();
    _salaryController.clear();
  }
}



//   class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final dbHelper = DatabaseHelper();
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _empNameController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _salaryController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Employee Database App'),
//       ),
//             body: FutureBuilder<List<Employee>>(
//         future: dbHelper.getAllEmployees(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No Employees found.'));
//           } else {
//             final employees = snapshot.data;
//             return ListView.builder(
//               itemCount: employees!.length,
//               itemBuilder: (context, index) {
//                 final employee = employees[index];
//                 return ListTile(
//                   title: Text('Employee Name: ${employee.EmpName}'),
//                   subtitle: Text('Age: ${employee.Age}, Salary: ${employee.Salary}'),
//                 );
//               },
//             );
//           }
//         },
//       ));
//   }}
// //   //     body: Center(
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: <Widget>[
//   //           Form(
//   //             key: _formKey,
//   //             child: Column(
//   //               children: [
//   //                 TextFormField(
//   //                   controller: _empNameController,
//   //                   decoration: InputDecoration(labelText: 'Employee Name'),
//   //                   validator: (value) {
//   //                     if (value!.isEmpty) {
//   //                       return 'Please enter Employee Name';
//   //                     }
//   //                     return null;
//   //                   },
//   //                 ),
//   //                 TextFormField(
//   //                   controller: _ageController,
//   //                   decoration: InputDecoration(labelText: 'Age'),
//   //                   validator: (value) {
//   //                     if (value!.isEmpty) {
//   //                       return 'Please enter Age';
//   //                     }
//   //                     return null;
//   //                   },
//   //                 ),
//   //                 TextFormField(
//   //                   controller: _salaryController,
//   //                   decoration: InputDecoration(labelText: 'Salary'),
//   //                   validator: (value) {
//   //                     if (value!.isEmpty) {
//   //                       return 'Please enter Salary';
//   //                     }
//   //                     return null;
//   //                   },
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //           ElevatedButton(
//   //             onPressed: () async {
//   //               if (_formKey.currentState!.validate()) {
//   //                 final employee = Employee(
//   //                   EmpName: _empNameController.text,
//   //                   Age: int.parse(_ageController.text),
//   //                   Salary: double.parse(_salaryController.text),
//   //                 );

//   //                 final result = await dbHelper.insertEmployee(employee);

//   //                 if (result != null && result > 0) {
//   //                   Fluttertoast.showToast(
//   //                     msg: 'Employee added successfully',
//   //                     gravity: ToastGravity.BOTTOM,
//   //                     toastLength: Toast.LENGTH_SHORT,
//   //                   );
//   //                   _clearFields(); // Clear input fields after successful insertion
//   //                 } else {
//   //                   Fluttertoast.showToast(
//   //                     msg: 'Failed to add employee',
//   //                     gravity: ToastGravity.BOTTOM,
//   //                     toastLength: Toast.LENGTH_SHORT,
//   //                   );
//   //                 }
//   //               }
//   //             },
//   //             child: Text('Insert Employee'),
//   //           ),
//   //           ElevatedButton(
//   //             onPressed: () async {
//   //               final employees = await dbHelper.getAllEmployees();
//   //               for (final employee in employees) {
//   //                       print('Employee ID: ${employee.EmpId}');
//   //     print('Employee Name: ${employee.EmpName}');
//   //     print('Age: ${employee.Age}');
//   //     print('Salary: ${employee.Salary}');
//   //     print('-------------------');

//   //               //  print('Employee: ${employee.EmpName}, Age: ${employee.Age}, Salary: ${employee.Salary}');
//   //               }
//   //             },
//   //             child: Text('Get All Employees'),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   void _clearFields() {
//     _empNameController.clear();
//     _ageController.clear();
//     _salaryController.clear();
//   }

//   @override
//   void dispose() {
//     _empNameController.dispose();
//     _ageController.dispose();
//     _salaryController.dispose();
//     super.dispose();
//   }
// }
