import 'package:payme/pages/menu/menu_page.dart';

import '../../database/users_database.dart';
import '../../models/user_model.dart';
import '../../services/io_service.dart';
import '../intro_page.dart';

class SignUp {
  final int phoneNumber;

  SignUp(this.phoneNumber) {
    builder(phoneNumber);
  }

  void builder(int phoneNumber) {
    String password = io.setPassword("\nYangi parol yarating(Chiqish -> 0): ");

    if (password == "0") {
      IntroPage(); //Raqam so'rashga qaytadi
    } else {
      bool isSuccess = db.createData(User(
        phoneNumber: phoneNumber,
        password: password,
      ));
      print(isSuccess
          ? "Foydalanuvchi muvaffaqiyatli qo'shildi"
          : "Ma'lumotlarda xatolik bor...");
      Menu(db.readData(phoneNumber));
    }
  }
}
