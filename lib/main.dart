import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projedeneme/page/explore_page.dart';
import 'package:projedeneme/page/notification_page.dart';
import 'package:projedeneme/routes/welcome.dart';
import 'package:projedeneme/routes/signup.dart';
import 'package:projedeneme/routes/login.dart';
import 'package:projedeneme/routes/WalkThrough.dart';
import 'package:projedeneme/routes/condition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:provider/provider.dart';
import 'package:projedeneme/services/auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:projedeneme/page/profile_page.dart';
import 'package:projedeneme/page/edit_profile_page.dart';
import 'package:projedeneme/page/explore_page2.dart';






void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // The following lines are the same as previously explained in "Handling uncaught errors"
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(MyFirebaseApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyFirebaseApp extends StatefulWidget {
  const MyFirebaseApp({Key? key}) : super(key: key);

  @override
  _MyFirebaseAppState createState() => _MyFirebaseAppState();
}

class _MyFirebaseAppState extends State<MyFirebaseApp> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('No Firebase Connection: ${snapshot.error.toString()}'),
              ),
            ),
          );
        }
        if(snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: MyApp(),
          );
        }
        return MaterialApp(
          home: Center(
            child: Text('Connecting to Firebase'),
          ),
        );
      },);
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        navigatorObservers: <NavigatorObserver>[observer],
        debugShowCheckedModeBanner: false,
        //home: LoginSign(),
        initialRoute: '/Condition' ,
        routes: {
          '/Condition': (context) => Condition(),
          '/WalkThrough': (context) => WalkThrough(),
          '/': (context) => Welcome(analytics: analytics, observer: observer),
          '/login': (context) => Login(),
          '/signup': (context) => SignUp(),
          '/profile_page': (context) => ProfilePage(),
          '/edit_profile_page': (context) => EditProfilePage(),
          '/notification_page': (context) => NotificationPage(),
          '/explore_page': (context) => ExplorePage(),
          '/explore_page2': (context) => ExplorePage2(),
        },
      ),
    );
  }

}
