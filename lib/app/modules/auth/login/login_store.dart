import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:here/app/models/auth_model.dart';
import 'package:here/app/modules/auth/repository/auth_repository.dart';

class LoginStore extends NotifierStore<Exception, int> {
  final TextEditingController ramalController = TextEditingController();

  LoginStore() : super(0);

  Future<void> login() async {
    Auth response = await AuthRepository().login(ramalController.text);
    print(response);
  }
}
