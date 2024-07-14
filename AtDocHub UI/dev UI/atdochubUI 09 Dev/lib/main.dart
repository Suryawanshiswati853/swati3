// // import 'package:AtDocHUB/View/homePageAdmin.dart';
// // import 'package:flutter/material.dart';
// // import 'package:AtDocHUB/View/LoginPage.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var usrEmail = prefs.getString('email');
//   String usrname = prefs.getString('username').toString();
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
//     home: usrEmail == null ? LoginPage() : homePageAdmin(usrname),
//   ));
// }

// class SharedPrefService {
//   static late SharedPreferences pref;

//   static Future<void> init() async {
//     pref = await SharedPreferences.getInstance();
//   }
// }

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

import 'package:AtDocHUB/View/Document/AddNewDocument.dart';
import 'package:flutter/material.dart';
//import 'package:newsapp/screens/home_screen.dart';
//import 'package:newsapp/screens/notification.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'View/LoginPage.dart';
import 'View/homePageAdmin.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // ignore: unused_local_variable
  String usrname = prefs.getString('username').toString();
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
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String usrname = SharedPrefService.pref.getString('username').toString();

    OneSignal.shared.setAppId('e89acaa4-5388-4e3a-bd69-44d197bdcbd7');
    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {});
    //OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      debugPrint('NOTIFICATION OPENED HANDLER CALLED WITH: $result');
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => AddNewDocument(usrname)),
            (Route<dynamic> route) => false);
      });
    });
    //);

    // OneSignal.shared.setNotificationWillShowInForegroundHandler(
    //     (OSNotificationReceivedEvent event) {
    //   setState(() {});
    // });

    //await OneSignal.shared.setAppId("d27b4c45-540c-41fb-b0c2-0f92cd13a664");
  }

  @override
  Widget build(BuildContext context) {
    var usrEmail = SharedPrefService.pref.getString('email');
    String usrname = SharedPrefService.pref.getString('username').toString();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.indigo,
        ),
        home: usrEmail == null ? LoginPage() : homePageAdmin(usrname));
  }
}
