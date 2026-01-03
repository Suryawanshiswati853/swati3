import 'package:AtDocHUB/View/Document/AddNewDocument.dart';
import 'package:AtDocHUB/View/Document/DocumentsDetails.dart';
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
    // String usrname = pref.getString('username').toString();
  }
}

class _MyAppState extends State<MyApp> {
  String playerId = '';
  GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    setState(() {
      this.playerId = osUserID!;
    });
    print('this.playerid from main.dart ${this.playerId}');
  }

  @override
  Widget build(BuildContext context) {
    var usrEmail = SharedPrefService.pref.getString('email');
    String usrname = SharedPrefService.pref.getString('username').toString();

    print('this.player id from override ....${this.playerId}');
    String pId = this.playerId;

    return MaterialApp(
      navigatorKey: navigatorkey,
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
      home: usrEmail == null ? LoginPage() : homePageAdmin(pId, usrname),
      //  routes: {'docdetail': (context) => DocumentsDetails(1, '')},
    );
  }
}
