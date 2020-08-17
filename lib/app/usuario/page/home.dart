import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:test_parse/app/usuario/controller/parse_controller.dart';
import 'package:test_parse/app/usuario/model/usuario_model.dart';
import 'package:test_parse/app/usuario/page/add_usuario.dart';
import 'package:test_parse/app/usuario/page/view_usuario.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final parse = GetIt.I.get<ParseController>();

  @override
  void initState() {
    parse.getUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste Parse"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddUsuario()));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "Listagem: ",
              style: TextStyle(fontSize: 20),
            ),
            Observer(
              builder: (_) {
                if (parse.loading) {
                  return CircularProgressIndicator(
                    strokeWidth: 10,
                  );
                } else {
                  return RefreshIndicator(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: parse.usuarios.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (parse.usuarios.length > 0) {
                          return cardUsuario(parse.usuarios[index]);
                        } else {
                          return Text("Nenhum item a exibir");
                        }
                      },
                    ),
                    onRefresh: () => parse.getUsuarios(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget cardUsuario(Usuario usuario) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(2),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(usuario.id),
                Text(usuario.nome),
                Text(usuario.email),
              ],
            ),
            IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {
                  parse.deletarUsuario(usuario);
                }),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UsuarioView(id: usuario.id)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
