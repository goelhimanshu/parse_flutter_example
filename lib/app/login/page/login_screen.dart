import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:test_parse/app/login/controller/login_controller.dart';
import 'package:test_parse/app/usuario/page/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final parse = GetIt.I.get<LoginController>();

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            controller: usernameController,
            decoration: InputDecoration(hintText: 'Username'),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'E-mail'),
          ),
          TextField(
            controller: passController,
            decoration: InputDecoration(hintText: 'Pass'),
          ),
          Observer(
            builder: (_) {
              return FlatButton(
                child: Text('Login'),
                onPressed: () async {
                  var response = await parse.login(usernameController.text,
                      passController.text, emailController.text);
                  if (response.objectId != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  } else {
                    print("Deu ruim");
                  }
                },
              );
            },
          ),
          FlatButton(
            onPressed: () {
              parse.signUP(usernameController.text, passController.text,
                  emailController.text);
            },
            child: Text('Sign Up'),
          ),
          FlatButton(
            child: Text('Logout'),
            onPressed: () async {
              var user = parse.parseUser;
              var response = await user.logout();
              if (response.success) {
                parse.parseUser = null;
                print("LOGOFF SUCCESS");
                usernameController.clear();
                emailController.clear();
                passController.clear();
              } else {
                print(response.error.message);
              }
            },
          )
        ],
      ),
    );
  }
}
