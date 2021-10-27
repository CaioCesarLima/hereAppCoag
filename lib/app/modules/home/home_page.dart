import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:here/app/models/user_model.dart';
import 'home_store.dart';
import 'package:grouped_list/grouped_list.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: ScopedBuilder<HomeStore, Exception, List<User>>(
        store: store,
        onState: (_, users) {
          return users == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        "Em sala",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: GridView.builder(
                                itemCount: users.length,
                                itemBuilder: (BuildContext context, int index) {
                                  ListTile(
                                      title:
                                          Text(users[index].nome.toString()));
                                  return Container(
                                    child: Center(
                                        child: Text(
                                      users[index].nome,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    )),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: users[index].office
                                            ? Colors.green
                                            : Colors.red),
                                  );
                                },
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 150,
                                        childAspectRatio: 3 / 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
        onError: (context, error) => Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
