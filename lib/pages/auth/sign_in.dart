import 'package:payme/database/users_database.dart';
import 'package:payme/pages/intro_page.dart';
import 'package:payme/pages/menu/menu_page.dart';
import 'package:payme/services/io_service.dart';

class SignIn {
  final int phoneNumber;

  SignIn(this.phoneNumber) {
    builder(phoneNumber);
  }

  void builder(int phoneNumber) {
    String password = io.inputText("Parolni kiriting(Chiqish -> 0): ");

    if (password == "0") {
      IntroPage(); //Raqam so'rashga qaytadi
    } else if (password == db.readData(phoneNumber).password) {
      print("Muvaffaqiyatli kirildi!");
      Menu(db.readData(phoneNumber));
    } else {
      print("Parol xato!");
      String commmand = io.inputText("1. Qayta urinish\n"
          "0. Chiqish\n"
          ">>> ");
      io.clr();
      if (commmand == "1") {
        builder(phoneNumber);
      } else {
        return;
      }
    }
  }
}
