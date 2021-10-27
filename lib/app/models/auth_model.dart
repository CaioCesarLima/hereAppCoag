import 'package:flutter/foundation.dart';

class Auth {
  final String ramal;
  final String name;
  final bool office;

  Auth(this.ramal, this.name, this.office);

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(json['ramal'], json['name'], json['here?']);
  }
}
