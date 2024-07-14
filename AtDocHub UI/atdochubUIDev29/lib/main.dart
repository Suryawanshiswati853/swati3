// import 'package:AtDocHUB/View/homePageAdmin.dart';
// import 'package:flutter/material.dart';
// import 'package:AtDocHUB/View/LoginPage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var usrEmail = prefs.getString('email');
//   //print(email);
//   // await SystemChrome.setPreferredOrientations([
//   //   DeviceOrientation.portraitUp,
//   //   DeviceOrientation.portraitDown,
//   // ]);

//   runApp(
//       //MultiProvider(
//       //  providers: [ChangeNotifierProvider(create: (_) => ChangeStatus())],
//       MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: "ATDOCHUB Dev",
//     // theme: ThemeData(
//     //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
//     //       .copyWith(secondary: Colors.white70),
//     // ),
//     home: usrEmail == null ? LoginPage() : homePageAdmin(),
//   ));
// }

// // class MainPage extends StatefulWidget {
// //   @override
// //   _MainPageState createState() => _MainPageState();
// // }

// // class _MainPageState extends State<MainPage> {
// //   int index = 0;

// //   @override
// //   Widget build(BuildContext context) => Scaffold(
// //         // bottomNavigationBar: buildBottomBar(),
// //         body: buildPages(),
// //      );

//   // Widget buildBottomBar() {
//   //   final style = TextStyle(color: Colors.white);

//   //   return BottomNavigationBar(
//   //     backgroundColor: Theme.of(context).primaryColor,
//   //     selectedItemColor: Colors.white,
//   //     unselectedItemColor: Colors.white70,
//   //     currentIndex: index,
//   //     items: [
//   //       BottomNavigationBarItem(
//   //           icon: Text('Filter List', style: style), label: 'Network'),
//   //     ],
//   //     onTap: (int index) => setState(() => this.index = index),
//   //   );
//   // }

//   // Widget buildPages() {
//   //   return DocumentPage();
//   // }
import 'package:AtDocHUB/View/Document/DocumentsDetails.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
//import 'package:newsapp/screens/home_screen.dart';
//import 'package:newsapp/screens/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/LoginPage.dart';
import 'View/homePageAdmin.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // ignore: unused_local_variable
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  //static final String oneSignalAppId = "e89acaa4-5388-4e3a-bd69-44d197bdcbd7";
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class SharedPrefService {
  static late SharedPreferences pref;

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
    var usrEmail = pref.getString('email');
    String usrname = pref.getString('username').toString();
  }
}

class _MyAppState extends State<MyApp> {
  String playerId = '';

  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
    init();
  }

  Future init() async {
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId('e89acaa4-5388-4e3a-bd69-44d197bdcbd7');
    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {});
    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;
    print('The player id from main.dart ...........${osUserID}');
    OneSignal.shared.setNotificationOpenedHandler(
        (OSNotificationOpenedResult result) async {
      var id = await result.notification.additionalData!["Docid"];
      final int newid = int.parse(id).toInt();
      print('id from notification...... $newid');
      navigatorKey.currentState!.push(
          MaterialPageRoute(builder: (context) => DocumentsDetails(newid, '')));
    });
    setState(() {
      this.playerId = osUserID!;
    });
    print('this.playerid from main.dart ${this.playerId}');
  }

  @override
  Widget build(BuildContext context) {
    var usrEmail = SharedPrefService.pref.getString('email');
    String usrname = SharedPrefService.pref.getString('username').toString();
    print(usrname);
    print('this.player id from override ....${this.playerId}');
    String pId = this.playerId;

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'AtDocHub',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: usrEmail == null
          ? LoginPage()
          : homePageAdmin(
              pId,
              usrname,
            ),
    );
  }
}



// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SharedPrefService.init();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   // ignore: unused_local_variable
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   //static final String oneSignalAppId = "e89acaa4-5388-4e3a-bd69-44d197bdcbd7";
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class SharedPrefService {
//   static late SharedPreferences pref;

//   static Future<void> init() async {
//     pref = await SharedPreferences.getInstance();
//     var usrEmail = pref.getString('email');
//     // String usrname = pref.getString('username').toString();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   String playerId = '';
//   GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

//   // This widget is the root of your application.
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initPlatformState();
//   }

//   Future init() async {
//     initPlatformState();

//     // final userRole = await LoginController.loginAdmin();
//     // setState(() {
//     //   this.userRole = userRole as List<UserLogin>;
//     //   print('The ROLES ${userRole[0].role}');
//     // });
//   }

//   Future<void> initPlatformState() async {
//     OneSignal.shared.setAppId('e89acaa4-5388-4e3a-bd69-44d197bdcbd7');
//     OneSignal.shared
//         .promptUserForPushNotificationPermission()
//         .then((accepted) {});
//     final status = await OneSignal.shared.getDeviceState();
//     final String? osUserID = status?.userId;
//     print('The player id from main.dart ...........${osUserID}');
//     setState(() {
//       this.playerId = osUserID!;
//     });
//     print('this.playerid from main.dart ${this.playerId}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     var usrEmail = SharedPrefService.pref.getString('email');
//     String usrname = SharedPrefService.pref.getString('username').toString();
//     print(usrname);
//     print('this.player id from override ....${this.playerId}');
//     String pId = this.playerId;

//     return MaterialApp(
//       navigatorKey: navigatorkey,
//       debugShowCheckedModeBanner: false,
//       title: 'AtDocHub',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.indigo,
//       ),
//       home: usrEmail == null
//           ? LoginPage()
//           : homePageAdmin(
//               usrname,
//             ),

//       //  routes: {'docdetail': (context) => DocumentsDetails(1, '')},
//     );
//   }
// }
