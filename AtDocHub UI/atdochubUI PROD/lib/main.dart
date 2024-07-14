import 'package:AtDocHUB/View/homePageAdmin.dart';
import 'package:flutter/material.dart';
import 'package:AtDocHUB/View/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var usrEmail = prefs.getString('email');
  //print(email);
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  runApp(
      //MultiProvider(
      //  providers: [ChangeNotifierProvider(create: (_) => ChangeStatus())],
      MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "ATDOCHUB ",
    // theme: ThemeData(
    //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
    //       .copyWith(secondary: Colors.white70),
    // ),
    home: usrEmail == null ? LoginPage() : homePageAdmin(),
  ));
}



// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int index = 0;

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         // bottomNavigationBar: buildBottomBar(),
//         body: buildPages(),
//      );

  // Widget buildBottomBar() {
  //   final style = TextStyle(color: Colors.white);

  //   return BottomNavigationBar(
  //     backgroundColor: Theme.of(context).primaryColor,
  //     selectedItemColor: Colors.white,
  //     unselectedItemColor: Colors.white70,
  //     currentIndex: index,
  //     items: [
  //       BottomNavigationBarItem(
  //           icon: Text('Filter List', style: style), label: 'Network'),
  //     ],
  //     onTap: (int index) => setState(() => this.index = index),
  //   );
  // }

  // Widget buildPages() {
  //   return DocumentPage();
  // }

