import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:here/app/models/user_model.dart';

class HomeRepository {
  CollectionReference users = FirebaseFirestore.instance.collection('/user');

  Stream<List<User>> streamTarefas() {
    return users
        .snapshots()
        .map((e) => e.docs.map((e) => User.fromjson(e.data())).toList());
  }
}
