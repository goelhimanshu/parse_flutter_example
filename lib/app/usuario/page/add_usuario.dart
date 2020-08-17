import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:test_parse/app/usuario/controller/parse_controller.dart';
import 'package:test_parse/app/usuario/model/usuario_model.dart';

class AddUsuario extends StatefulWidget {
  AddUsuario({Key key}) : super(key: key);

  @override
  _AddUsuarioState createState() => _AddUsuarioState();
}

class _AddUsuarioState extends State<AddUsuario> {
  final parse = GetIt.I.get<ParseController>();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Usuario novoUsuario = new Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Usuario"),
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Nome", border: OutlineInputBorder()),
                  onChanged: (String value) {
                    novoUsuario.nome = value;
                    print(novoUsuario.nome);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Telefone", border: OutlineInputBorder()),
                  onChanged: (String value) {
                    novoUsuario.telefone = value;
                    print(novoUsuario.telefone);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email", border: OutlineInputBorder()),
                  onChanged: (String value) {
                    novoUsuario.email = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Endereço", border: OutlineInputBorder()),
                  onChanged: (String value) {
                    novoUsuario.endereco = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: FlatButton(
                  onPressed: () {
                    parse.enviarUsuario(novoUsuario);
                  },
                  child: Text("Enviar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
