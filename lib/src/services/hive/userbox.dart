import 'package:cashcollect/src/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class UserBox {
  static void add(UserModel user) {
    Hive.box('userBox').put(user.uid, user);
  }

  static UserModel getUser(String uid) => Hive.box('userBox').get(uid);
}
