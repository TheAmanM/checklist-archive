import 'package:checklist/auth/auth_services.dart';
import 'package:checklist/constants.dart';
import 'package:flutter/material.dart';

class AuthMain extends StatefulWidget {
  const AuthMain({Key key}) : super(key: key);

  @override
  _AuthMainState createState() => _AuthMainState();
}

class _AuthMainState extends State<AuthMain> {
  int index = 0;
  TextEditingController phoneController = new TextEditingController();
  bool loading = false;

  @override
  void initState() {
    phoneController.text = '+92';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(),
            cTextField(
              phoneController,
            ),
            Spacer(),
            loading
                ? Container(color: Colors.orange)
                : cFlatActionButton(
                    'NEXT',
                    () async {
                      setState(() {
                        loading = true;
                      });
                      await verifyPhone(
                        phoneController.text,
                      );
                    },
                  ),
            // bottomSheet(index),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
