// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parse_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ParseController on _ParseControllerBase, Store {
  final _$usuariosAtom = Atom(name: '_ParseControllerBase.usuarios');

  @override
  List<Usuario> get usuarios {
    _$usuariosAtom.reportRead();
    return super.usuarios;
  }

  @override
  set usuarios(List<Usuario> value) {
    _$usuariosAtom.reportWrite(value, super.usuarios, () {
      super.usuarios = value;
    });
  }

  final _$usuarioRetrieveAtom =
      Atom(name: '_ParseControllerBase.usuarioRetrieve');

  @override
  Usuario get usuarioRetrieve {
    _$usuarioRetrieveAtom.reportRead();
    return super.usuarioRetrieve;
  }

  @override
  set usuarioRetrieve(Usuario value) {
    _$usuarioRetrieveAtom.reportWrite(value, super.usuarioRetrieve, () {
      super.usuarioRetrieve = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ParseControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$initParseAsyncAction = AsyncAction('_ParseControllerBase.initParse');

  @override
  Future<dynamic> initParse() {
    return _$initParseAsyncAction.run(() => super.initParse());
  }

  final _$getUsuariosAsyncAction =
      AsyncAction('_ParseControllerBase.getUsuarios');

  @override
  Future<dynamic> getUsuarios() {
    return _$getUsuariosAsyncAction.run(() => super.getUsuarios());
  }

  final _$getUsuarioByIdAsyncAction =
      AsyncAction('_ParseControllerBase.getUsuarioById');

  @override
  Future<dynamic> getUsuarioById(String id) {
    return _$getUsuarioByIdAsyncAction.run(() => super.getUsuarioById(id));
  }

  final _$enviarUsuarioAsyncAction =
      AsyncAction('_ParseControllerBase.enviarUsuario');

  @override
  Future<dynamic> enviarUsuario(Usuario novoUsuario) {
    return _$enviarUsuarioAsyncAction
        .run(() => super.enviarUsuario(novoUsuario));
  }

  final _$atualizarUsuarioAsyncAction =
      AsyncAction('_ParseControllerBase.atualizarUsuario');

  @override
  Future<dynamic> atualizarUsuario(Usuario editarUsuario) {
    return _$atualizarUsuarioAsyncAction
        .run(() => super.atualizarUsuario(editarUsuario));
  }

  final _$deletarUsuarioAsyncAction =
      AsyncAction('_ParseControllerBase.deletarUsuario');

  @override
  Future<dynamic> deletarUsuario(Usuario novoUsuario) {
    return _$deletarUsuarioAsyncAction
        .run(() => super.deletarUsuario(novoUsuario));
  }

  final _$enviarArquivoAsyncAction =
      AsyncAction('_ParseControllerBase.enviarArquivo');

  @override
  Future<dynamic> enviarArquivo() {
    return _$enviarArquivoAsyncAction.run(() => super.enviarArquivo());
  }

  @override
  String toString() {
    return '''
usuarios: ${usuarios},
usuarioRetrieve: ${usuarioRetrieve},
loading: ${loading}
    ''';
  }
}
