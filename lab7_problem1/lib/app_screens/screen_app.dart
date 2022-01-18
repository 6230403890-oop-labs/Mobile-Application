import 'package:flutter/material.dart';
import 'pictureapp.dart';
import 'button.dart';

class firstscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          padding:
              const EdgeInsets.only(right: 10, left: 10, top: 70, bottom: 10),
          color: Colors.green,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: const [
                    Expanded(
                        child: Text(
                      "Patharadach Maneewong",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepOrange,
                          fontSize: 20.0),
                    )),
                    Expanded(
                      child: Text(
                        "623040389-0",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepOrange,
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: const [
                    Expanded(
                        child: Text(
                      "Photo Credit",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                          fontSize: 20.0),
                    )),
                    Expanded(
                        child: Text(
                      "Mujjalin boonsrang",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                          fontSize: 20.0),
                    ))
                  ],
                ),
              ),
              Container(
                child: const PictureCall(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const sentbutton(),
              )
            ],
          )),
    );
  }
}
