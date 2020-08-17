import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:test_parse/app/usuario/controller/parse_controller.dart';
import 'package:test_parse/app/usuario/page/edit_usuario.dart';

class UsuarioView extends StatefulWidget {
  final String id;

  const UsuarioView({Key key, @required this.id}) : super(key: key);

  @override
  _UsuarioViewState createState() => _UsuarioViewState();
}

class _UsuarioViewState extends State<UsuarioView> {
  final parse = GetIt.I.get<ParseController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      parse.getUsuarioById(this.widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text(parse.usuarioRetrieve.nome == null
                ? ''
                : parse.usuarioRetrieve.nome);
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          if (parse.loading) {
            return CircularProgressIndicator(
              strokeWidth: 10,
            );
          } else {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Nome: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(parse.usuarioRetrieve.nome),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Email: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(parse.usuarioRetrieve.email),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Telefone: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(parse.usuarioRetrieve.telefone),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Endereço: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(parse.usuarioRetrieve.endereco),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditUser(id: this.widget.id)),
                    ),
                    child: Text("Editar"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    onPressed: () {
                      parse.enviarArquivo();
                    },
                    child: Text("Enviar Arquivo"),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
