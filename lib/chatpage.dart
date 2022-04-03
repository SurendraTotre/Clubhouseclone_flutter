import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              child: Icon(CupertinoIcons.back),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text("Chat"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Chats",
                ),
                Tab(
                  text: "Requests",
                )
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
              IconButton(
                  onPressed: () {}, icon: Icon(CupertinoIcons.envelope_badge))
            ],
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text("Chats"),
              ),
              Center(
                child: Text("Requests"),
              )
            ],
          ),
        ));
  }
}
