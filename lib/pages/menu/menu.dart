import 'package:payme/models/card_model.dart';
import 'package:payme/pages/builder.dart';
import 'package:payme/pages/intro_page.dart';
import 'package:payme/services/io_service.dart';

import '../../models/user_model.dart';

class Menu extends Builder {
  User user;
  Menu(this.user);

  @override
  void builder() {
    super.builder();
    Center(text: "| Menu |");
    String command = io.inputText("1. Kartalarni ko'rish\n"
        "2. Karta qo'shish\n"
        "3. To'lov qilish\n"
        "4. Hisobni to'ldirish\n"
        "0. Chiqish\n"
        ">>> ");
    switch (command) {
      case "0":
        IntroPage();
        break;
      case "1":
        user.readAllCards();
        io.inputText("text");
        break;
      case "2":
        IntroPage();
        break;
      case "3":
        IntroPage();
        break;
      case "4":
        IntroPage();
        break;
      default:
    }
  }
}

void main(List<String> args) {
  Menu(
    User(
      phoneNumber: 993041155,
      password: "123456",
    ),
  );
}
