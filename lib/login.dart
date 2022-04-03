import 'package:flutter/material.dart';
import 'package:clubhoseclone/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); //key for form
  //String name='Surendra', num='8356032646', password='Surendr@25';

  //firebase
  final _auth = FirebaseAuth.instance;


  void login(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())
        )
      })
          .catchError((e) {
        Fluttertoast.showToast(msg: "Wrong Password For Given Email ID!");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;

    return  Scaffold(
        appBar: AppBar(
          title: Text('ClubHouse',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'SourceSansPro-Bold'),
          ),
          backgroundColor: Color(0xFFF6F6BF),
        ),

        backgroundColor: Color(0xFFC7AD66),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,//key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'),
                  radius: 40,
                ),

                SizedBox(height: height*0.01,),
                Text(
                  "Log-in",
                  style: TextStyle(
                    fontFamily: "SourceSansPro",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: _email,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Enter Your Email ID',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                      return 'Enter Correct Email ID';
                    }else{
                      return null;
                    }
                  },
                ),

                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: _password,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Enter Your Password',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter Correct Password';
                    }else if(value.length < 6){
                      return 'Should Be At Least 6 Characters';
                    }else if(value.length > 15){
                      return 'Should Not Be More Than 15 Characters';
                    }else{
                      return null;
                    }
                  },
                ),

                Padding(
                    padding: EdgeInsets.all(12),
                    child: ElevatedButton(
                      onPressed: () {
                        login(_email.text, _password.text);
                      },
                      child: Text('Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
                ),

                TextButton(onPressed: () {},
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 40,),
                  child: Text(
                    'New User?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}