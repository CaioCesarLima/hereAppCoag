import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String nome;
  final bool office;

  User(this.id, this.nome, this.office);

  factory User.fromjson(Map<String, dynamic> snapshot) {
    return User(snapshot['ramal'], snapshot['name'], snapshot['here?']);
  }
}
