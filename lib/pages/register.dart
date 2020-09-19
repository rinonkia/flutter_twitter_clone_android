import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String newUserEmail = "";
  String newUserPassword = "";
  String infoText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  setState(() {
                    newUserEmail = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "パスワード(6文字以上)"),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    newUserPassword = value;
                  });
                },
              ),
              RaisedButton(
                onPressed: () async {
                  try {
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final AuthResult result =
                        await auth.createUserWithEmailAndPassword(
                            email: newUserEmail, password: newUserPassword);

                    final FirebaseUser user = result.user;
                    setState(() {
                      infoText = "登録OK: ${user.email}";
                    });
                  } catch (e) {
                    setState(() {
                      infoText = "登録NG: ${e.message}";
                    });
                  }
                },
                child: Text("ユーザー登録"),
              ),
              Text(infoText),
            ],
          ),
        ),
      ),
    );
  }
}
