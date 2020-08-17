import 'package:parse_server_sdk/parse_server_sdk.dart';

const String _keyTableName = 'Usuarios';
const String keyObjectId = 'objectId';
const String keyNome = 'nome';
const String keyEmail = 'email';
const String keyTelefone = 'telefone';
const String keyEndereco = 'endereco';

class Usuario extends ParseObject implements ParseCloneable {
  Usuario() : super(_keyTableName);
  Usuario.clone() : this();

  @override
  Usuario clone(Map<String, dynamic> map) => Usuario.clone()..fromJson(map);

  String get id => get<String>(keyObjectId);
  set id(String id) => set<String>(keyObjectId, id);

  String get nome => get<String>(keyNome);
  set nome(String nome) => set<String>(keyNome, nome);

  String get email => get<String>(keyEmail);
  set email(String email) => set<String>(keyEmail, email);

  String get telefone => get<String>(keyTelefone);
  set telefone(String telefone) => set<String>(keyTelefone, telefone);

  String get endereco => get<String>(keyEndereco);
  set endereco(String endereco) => set<String>(keyEndereco, endereco);
}
