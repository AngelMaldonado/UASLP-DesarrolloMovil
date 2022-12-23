import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var users = <User>[];

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index].name.toString()));
          },
        ));
  }
}

class API {
  static Future getUsers() {
    var url = "https://jsonplaceholder.typicode.com" + "/users";
    return http.get(Uri.parse(url));
  }
}

class User {
  int? id;
  String? name;
  String? email;

  User(this.id, this.name, String mail) {
    email = mail;
  }

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        email = json['email'];

  Map toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}
