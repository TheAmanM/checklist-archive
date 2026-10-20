import 'package:flutter/material.dart';

class AccountSetup extends StatefulWidget {
  @override
  _AccountSetupState createState() => _AccountSetupState();
}

/*

Email + Password
Name
Color
Theme preference

*/

Widget heading(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    textAlign: TextAlign.left,
  );
}

class _AccountSetupState extends State<AccountSetup> {
  List<List<Widget>> items = [
    [
      heading(
        'Account Details',
      ),
    ],
    [
      heading(
        'Name',
      ),
    ],
    [
      heading(
        'Color',
      ),
    ],
    [
      heading(
        'Preference',
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              child: Column(
                children: items[index],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            );
          },
        ),
      ),
    );
  }
}
