import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:test_parse/app/usuario/model/usuario_model.dart';
part 'parse_controller.g.dart';

class ParseController = _ParseControllerBase with _$ParseController;

abstract class _ParseControllerBase with Store {
  @observable
  List<Usuario> usuarios = [];

  @observable
  Usuario usuarioRetrieve;

  @observable
  bool loading = false;

  final picker = ImagePicker();

  @action
  Future initParse() async {
    var settings =
        await jsonDecode(await rootBundle.loadString('assets/settings.json'));
    print(settings);
    await Parse().initialize(settings['appId'], settings['serveUrl'],
        debug: true,
        autoSendSessionId: true,
        clientKey: settings['clienteApiKey'],
        liveQueryUrl: settings['liveQueryUrl']);
  }

  @action
  Future getUsuarios() async {
    this.loading = true;
    var response = await Usuario().getAll();
    if (response.success) {
      usuarios = [];
      response.results.forEach((element) {
        usuarios.add(element);
      });
    }
    this.loading = false;
  }

  @action
  Future getUsuarioById(String id) async {
    this.loading = true;
    var response = await Usuario().getObject(id);
    if (response.success) {
      usuarioRetrieve = response.results[0];
    }
    this.loading = false;
  }

  @action
  Future enviarUsuario(Usuario novoUsuario) async {
    var response = await novoUsuario.save();
    if (response.success) {
      novoUsuario = response.results.first;
    }
  }

  @action
  Future atualizarUsuario(Usuario editarUsuario) async {
    var response = await editarUsuario.save();
    if (response.success) {
      editarUsuario = response.results.first;
    } else {
      print("Deu ruim =(");
    }
  }

  @action
  Future deletarUsuario(Usuario novoUsuario) async {
    var response = await novoUsuario.delete();
    if (response.success) {
      novoUsuario = response.results.first;
    }
  }

  @action
  Future enviarArquivo() async {
    final image = await picker.getImage(source: ImageSource.gallery);
    File parseImage = File(image.path);
    ParseFile parseFile =
        ParseFile(parseImage, name: "imageTest.jpg", debug: true);
    var fileResponse = await parseFile.save();
    if (fileResponse.success) {
      parseFile = fileResponse.result as ParseFile;
      print(parseFile.url);
      print("Upload with success");
    } else {
      print("Upload with failed");
      return;
    }
  }
}
