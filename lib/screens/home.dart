import 'package:flutter/material.dart';

import '../model/user.dart';
import '../widget/cheetah_button.dart';
import '../widget/riverpod_input.dart';
import '../widget/user_list.dart';
import 'user_list_screen.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String? _name;
  String? _city;

  List<User> userList = [];

  addUser(User user) {
    setState(() {
      userList.add(user);
    });
  }

  deleteUser(User user) {
    setState(() {
      userList.removeWhere((_user) => _user.name == user.name);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Flutter Riverpod ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Flutter State Management with Riverpod",
                style: TextStyle(fontSize: 16, color: Colors.pink),
              ),
              SizedBox(height: 5),
              const Text(
                "Flutter Hooks,Flutter Riverpod",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 16),
              CheetahInput(
                labelText: 'Name',
                onSaved: (String? value) {
                  _name = value;
                },
              ),
              SizedBox(height: 16),
              CheetahInput(
                labelText: 'City',
                onSaved: (String? value) {
                  _city = value;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: 'Add',
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;

                      _formKey.currentState!.save();

                      addUser(User(_name, _city));
                    },
                  ),
                  SizedBox(width: 8),
                  CustomButton(
                    text: 'List',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserListScreen(userList, deleteUser),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              UserList(userList, deleteUser),
            ],
          ),
        ),
      ),
    );
  }
}
