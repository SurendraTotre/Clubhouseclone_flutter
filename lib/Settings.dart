import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubhoseclone/MODAL/User.dart';
import 'package:clubhoseclone/login.dart';
import 'package:clubhoseclone/UTILS/AppColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  User? user = FirebaseAuth.instance.currentUser;

  ClubhouseUser clubhouseUser = ClubhouseUser(uid: '', email: '', name: '', num: '');

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) => {
      this.clubhouseUser = ClubhouseUser.fromMap(value.data()),
      setState(() {}),
    });
  }

  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(CupertinoIcons.back),
          ),
          title: Text("SETTINGS"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.secondryColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.0,
                        spreadRadius: 0.5,
                      ),
                    ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.png'),
                    radius: 50,
                  ),
                  title: Text("${clubhouseUser.name}"),
                  subtitle: Text("+91 ${clubhouseUser.num}"),
                  trailing: Icon(CupertinoIcons.arrow_right),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.secondryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Pause Notification"),
                      trailing: Switch(
                        value: false,
                        onChanged: null,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Send Fewer Notification"),
                      trailing: Switch(
                        value: false,
                        onChanged: null,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Notification Setting"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.arrow_right),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondryColor,
                ),
                child: ListTile(
                  title: Text("Interests"),
                  trailing: Icon(CupertinoIcons.arrow_right),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.secondryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    ListTile(
                        title: Text("What's New"),
                        trailing: Icon(CupertinoIcons.arrow_up_right)),
                    Divider(),
                    ListTile(
                        title: Text("FAQ/Contact Us"),
                        trailing: Icon(CupertinoIcons.arrow_up_right)),
                    Divider(),
                    ListTile(
                      title: Text("Privacy Policy"),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.arrow_up_right)),
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                color: AppColor.secondryColor,
                onPressed: () {
                  logout(context);
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                textColor: Colors.red,
              ),
              Text(
                "Version 1.0.1",
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ));
  }
}
