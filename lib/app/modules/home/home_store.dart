import 'dart:async';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:here/app/models/user_model.dart';
import 'package:here/app/modules/home/repository/home_repository.dart';

class HomeStore extends StreamStore<Exception, List<User>> {
  final homerepository = HomeRepository();

  HomeStore() : super(null);

  Future<void> getUsers() async {
    setLoading(true);

    Stream<List<User>> users = homerepository.streamTarefas();
    users.forEach((element) {
      element.sort((User element, User elementb) =>
          element.nome.compareTo(elementb.nome));
      update(element);
    });
    //update(users);
    setLoading(false);
  }
}
