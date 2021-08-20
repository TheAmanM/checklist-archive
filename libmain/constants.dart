import 'package:flutter/material.dart';

Color mainColor = Color(0xFF0066F1);
Color accentColor = Color(0xFF4903ff);

Color backColor = Color(0xFF0E121B);
Color lightBackColor = Color(0xFF171C26);
Color lightModeBackColor = Color(0xFFFCFCFC);
Color lightModeLightBackColor = Color(0xFFF7F7FB);

IconButton backArrow(BuildContext context) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back_ios,
      size: 20.0,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}

TextStyle wStyle = new TextStyle(
  color: Colors.white,
);

TextStyle bStyle = new TextStyle(
  color: Colors.black,
);

cSnackBar(String text) {
  return SnackBar(
    content: Text(text),
  );
}

AppBar cAppBar(String title, [Widget leading, List<Widget> actions]) {
  return AppBar(
    title: Text('Feature request / Bug report'),
    elevation: 0,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            mainColor,
            accentColor,
          ],
        ),
      ),
    ),
  );
}

Widget cTextField(TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
      ),
    ),
  );
}

FlatButton cFlatActionButton(String text, Function onPress) {
  return FlatButton(
    onPressed: onPress,
    child: Text(
      text,
      style: wStyle,
    ),
    color: mainColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        100,
      ),
    ),
  );
}

FlatButton cFlatButton(String text, Function onPress) {
  return FlatButton(
    onPressed: onPress,
    child: Text(
      text,
      // style: wStyle,
    ),
    // color: mainColor,
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(
    //     100,
    //   ),
    // ),
  );
}
