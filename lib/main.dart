import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_parse/app/login/controller/login_controller.dart';
import 'package:test_parse/app/login/page/login_screen.dart';
import 'package:test_parse/app/usuario/controller/parse_controller.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerLazySingleton<ParseController>(() => ParseController());
  getIt.registerLazySingleton<LoginController>(() => LoginController());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final parse = GetIt.I.get<ParseController>();

  @override
  void initState() {
    parse.initParse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen());
  }
}
