import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.back),
        elevation: 0,
        title: Text('Activity'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          padding: const EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'),
                    radius: 25,
                  ),
                  Text("Notification Numer $index"),
                  Text("1$index hrs"),
                ],
              ),
            );
          }),
    );
  }
}
