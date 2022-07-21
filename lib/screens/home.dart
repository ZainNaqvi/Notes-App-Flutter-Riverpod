import 'package:flutter/material.dart';

import '../model/user.dart';
import '../widget/cheetah_button.dart';
import '../widget/cheetah_input.dart';
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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Riverpod Demo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Cheetah Coding",
                style: TextStyle(fontSize: 30),
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
                  CheetahButton(
                    text: 'Add',
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;

                      _formKey.currentState!.save();

                      addUser(User(_name, _city));
                    },
                  ),
                  SizedBox(width: 8),
                  CheetahButton(
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
