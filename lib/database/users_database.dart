import '../models/user_model.dart';

DataBase db = DataBase();

///Users ma'lumotlarini saqlaydigan class
class DataBase {
  //Data saqlanadigan Map
  Map<int, Map<String, Object?>> dataBase = {
    993041155: User(phoneNumber: 993041155, password: "123456").toMap(),
  }; //fake database

  //* CRUD -> Create, Read, Update, Delete

  ///Create -> yangi userni database ga qo'shish uchun
  bool createData(User user) {
    if (dataBase[user.phoneNumber] != null) return false;
    final data = user.toMap();
    dataBase[user.phoneNumber] = data;
    return true;
  }

  ///isInDataBase -> user databaseda borligini tekshirish
  bool isInDataBase(int phoneNumber) {
    if (dataBase[phoneNumber] != null) {
      return true;
    } else {
      return false;
    }
  }

  ///Read -> databasedan user olish
  User readData(int phoneNumber) {
    final data = dataBase[phoneNumber]!;
    return User.fromMap(data);
  }
}
