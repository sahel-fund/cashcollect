import 'package:cashcollect/src/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class UserAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    return reader.read(1);
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.write<UserModel>(obj);
  }
}
