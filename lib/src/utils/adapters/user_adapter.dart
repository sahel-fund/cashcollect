import 'package:cashcollect/src/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class UserAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    return reader.read(typeId);
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.write<UserModel>(obj);
  }
}
