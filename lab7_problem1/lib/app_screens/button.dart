import 'package:flutter/material.dart';

class sentbutton extends StatelessWidget {
  const sentbutton({Key? key}) : super(key: key);
  void alertMsg(BuildContext context) {
    var alertDialog = const AlertDialog(
      title: Text("Confirmation"),
      content: Text("Submitting information"),
    );
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlueAccent,
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
          textStyle: const TextStyle(fontSize: 30),
        ),
        child: const Text(
          "sent",
          style: TextStyle(fontSize: 30),
        ),
        onPressed: () => {alertMsg(context)},
      ),
    );
  }
}
