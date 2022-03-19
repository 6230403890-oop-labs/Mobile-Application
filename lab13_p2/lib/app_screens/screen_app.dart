import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.only(left: 30, right: 30),
      height: 150,
      width: 420,
      child: const Text("ภัทรเดช มณีวงษ์",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.0,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.w700,
          )),
    );
  }
}
