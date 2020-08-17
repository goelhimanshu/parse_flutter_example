import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:test_parse/app/usuario/controller/parse_controller.dart';
import 'package:test_parse/app/usuario/model/usuario_model.dart';

class EditUser extends StatefulWidget {
  final String id;
  EditUser({Key key, @required this.id}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final parse = GetIt.I.get<ParseController>();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Usuario usuarioEditado = new Usuario();
  final TextEditingController _nomeText = new TextEditingController();
  final TextEditingController _telefoneText = new TextEditingController();
  final TextEditingController _emailText = new TextEditingController();
  final TextEditingController _enderecoText = new TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await parse.getUsuarioById(this.widget.id);
      usuarioEditado.id = parse.usuarioRetrieve.id;
      _nomeText.text = parse.usuarioRetrieve.nome;
      _telefoneText.text = parse.usuarioRetrieve.telefone;
      _emailText.text = parse.usuarioRetrieve.email;
      _enderecoText.text = parse.usuarioRetrieve.endereco;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Usuario"),
      ),
      body: Observer(builder: (_) {
        if (parse.loading) {
          return CircularProgressIndicator(
            strokeWidth: 10,
          );
        } else {
          return Container(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      controller: _nomeText,
                      decoration: InputDecoration(
                          labelText: "Nome", border: OutlineInputBorder()),
                      onChanged: (String value) {
                        usuarioEditado.nome = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      controller: _telefoneText,
                      decoration: InputDecoration(
                          labelText: "Telefone", border: OutlineInputBorder()),
                      onChanged: (String value) {
                        usuarioEditado.telefone = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      controller: _emailText,
                      decoration: InputDecoration(
                          labelText: "Email", border: OutlineInputBorder()),
                      onChanged: (String value) {
                        usuarioEditado.email = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      controller: _enderecoText,
                      decoration: InputDecoration(
                          labelText: "Endereço", border: OutlineInputBorder()),
                      onChanged: (String value) {
                        usuarioEditado.endereco = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                      onPressed: () {
                        parse.atualizarUsuario(usuarioEditado);
                      },
                      child: Text("Enviar"),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
