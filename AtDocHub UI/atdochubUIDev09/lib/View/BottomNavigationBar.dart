// import 'package:b2/View/AppointmentPageFE.dart';
// import 'package:b2/View/LoginPage.dart';
// import 'package:b2/View/homePageAdmin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// import 'Activity/ActivityStatusPage.dart';
// import 'Document/DocumentPage.dart';
// //import 'package:b2/View/DocumentPage.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<Widget> pages = [
//     homePageAdmin(),
//     DocumentsPage(),
//     AppointmentPageFE(),
//     ActivityStatusPage(),
//   ];
//   int selectedPageIndex = 0;

//   int pageIndex = 0;

//   void selectPage(int index) {
//     setState(() {
//       selectedPageIndex = index;
//     });
//   // }

//   final minimumPadding = 2.0;
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[selectedPageIndex],
//       bottomNavigationBar: SingleChildScrollView(
//         child: BottomNavigationBar(
//           onTap: selectPage,
//           items: [
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: '',
//                 backgroundColor: Color.fromARGB(255, 3, 87, 156),
//                 tooltip: 'Home '),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.file_copy_rounded),
//               label: 'Documents ',
//               //     backgroundColor: Color.fromARGB(255, 3, 87, 156),
//               //  tooltip: 'Documents Page'
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.schedule),
//               label: 'Appointment ',
//               //   backgroundColor: Color.fromARGB(255, 3, 87, 156),
//               //   tooltip: 'Appointments Page'
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.local_activity),
//               label: 'Activity ',
//               //   backgroundColor: Color.fromARGB(255, 3, 87, 156),
//               //tooltip: 'Activity Page'
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           //   selectedItemColor: Colors.amber[800],

//           //onTap: _onItemTapped),
//         ),
//       ),
//     );
//   }
// }
