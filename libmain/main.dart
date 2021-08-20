import 'package:checklist/auth/auth.dart';
import 'package:checklist/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'auth/auth_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkMode = false;

  void setAppTheme() {
    darkMode = true;
  }

  Stream<FirebaseUser> checkAuth() {
    // return auth.onAuthStateChanged;
    Stream<FirebaseUser> test = auth.currentUser().asStream();
    print(test);
    return test;
  }

  @override
  void initState() {
    setState(() {
      setAppTheme();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: mainColor,
        accentColor: accentColor,
        textTheme: TextTheme(
          headline5: TextStyle(
            color: darkMode ? Colors.white : Colors.black,
          ),
          subtitle1: TextStyle(
            color: darkMode ? Colors.white : Colors.black,
          ),
        ),
        scaffoldBackgroundColor: darkMode ? backColor : lightModeBackColor,
        // bottomSheetTheme: BottomSheetThemeData(
        //   backgroundColor: Colors.transparent,
        // ),
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: checkAuth(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          // return AuthMain();
          // if (snapshot.hasData && snapshot.data != null) {
          //   return AuthMain();
          //   // if (snapshot.data != null) {
          //   //   return Home();
          //   // } else {
          //   // }
          // } else {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Home(snapshot.data.uid);
            } else {
              return AuthMain();
            }
          } else {
            return Center(
              child: Text(
                'no data!',
              ),
            );
          }
        },
      ),
    );
  }
}
