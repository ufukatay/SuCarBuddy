import 'package:flutter/material.dart';
import 'package:projedeneme/routes/welcome.dart';
import 'package:projedeneme/routes/signup.dart';
import 'package:projedeneme/routes/login.dart';
import 'package:projedeneme/routes/WalkThrough.dart';
import 'package:projedeneme/routes/condition.dart';
import 'package:firebase_core/firebase_core.dart';




void main() {

  runApp(MyFirebaseApp());
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: LoginSign(),
        initialRoute: '/Condition' ,
        routes: {
          '/Condition': (context) => Condition(),
          '/': (context) => Welcome(),
          '/WalkThrough': (context) => WalkThrough(),
          '/login': (context) => Login(),
          '/signup': (context) => SignUp(),
        }
    );
  }
}














