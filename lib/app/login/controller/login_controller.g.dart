// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$parseUserAtom = Atom(name: '_LoginControllerBase.parseUser');

  @override
  ParseUser get parseUser {
    _$parseUserAtom.reportRead();
    return super.parseUser;
  }

  @override
  set parseUser(ParseUser value) {
    _$parseUserAtom.reportWrite(value, super.parseUser, () {
      super.parseUser = value;
    });
  }

  final _$_userloadAsyncAction = AsyncAction('_LoginControllerBase._userload');

  @override
  Future<dynamic> _userload() {
    return _$_userloadAsyncAction.run(() => super._userload());
  }

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future<ParseUser> login(dynamic username, dynamic pass, dynamic email) {
    return _$loginAsyncAction.run(() => super.login(username, pass, email));
  }

  final _$signUPAsyncAction = AsyncAction('_LoginControllerBase.signUP');

  @override
  Future<ParseUser> signUP(dynamic username, dynamic pass, dynamic email) {
    return _$signUPAsyncAction.run(() => super.signUP(username, pass, email));
  }

  @override
  String toString() {
    return '''
parseUser: ${parseUser}
    ''';
  }
}
