import 'package:uuid/uuid.dart';

class UserModel {
  String id = Uuid().v4();
  final String title;
  final String desc;

  UserModel({required this.id, required this.title, required this.desc});
}
