import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  String uid;
  Home(String uid);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          uid,
        ),
      ),
    );
  }
}
