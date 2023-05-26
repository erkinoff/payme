import '../models/user_model.dart';

DataBase db = DataBase();

class DataBase {
  Map<int, Map<String, Object?>> dataBase = {};

  //* CRUD -> Create, Read, Update, Delete

  ///Create -> yangi userni database ga qo'shish uchun
  bool createData(User user) {
    if (dataBase[user.phoneNumber] == null) {
      final data = user.toMap();
      dataBase[user.phoneNumber] = data;
      return true;
    }
    return false;
  }

  ///isInDataBase -> user databaseda borligini tekshirish
  bool isInDataBase(int phoneNumber) {
    if (dataBase[phoneNumber] != null) {
      return true;
    } else {
      return false;
    }
  }
}
