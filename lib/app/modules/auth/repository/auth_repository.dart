import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:here/app/models/auth_model.dart';

class AuthRepository {
  CollectionReference users = FirebaseFirestore.instance.collection('/user');

  Future<Auth> login(String ramal) async {
    DocumentSnapshot response = await users.doc(ramal).get();
    Map<String, dynamic> responseJson = json.decode(response.data());
    return Auth(
        responseJson['ramal'], responseJson['name'], responseJson['here?']);
  }
}
