import 'package:flutter/material.dart';
import 'package:projedeneme/routes/welcome.dart';
import 'package:projedeneme/routes/signup.dart';
import 'package:projedeneme/routes/login.dart';
import 'package:projedeneme/routes/WalkThrough.dart';
import 'package:projedeneme/routes/condition.dart';


void main() {
  runApp( MaterialApp(
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
  )
  );
}













