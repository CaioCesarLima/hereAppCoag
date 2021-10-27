import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:here/app/modules/auth/login/login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "LoginPage"}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'Telefonia',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  controller: store.ramalController,
                  decoration: InputDecoration(
                    labelText: 'Ramal',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(10)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.cyanAccent)),
                  onPressed: () {
                    print(store.ramalController.text);
                    store.login();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Acessar',
                      style: TextStyle(color: Colors.black),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
