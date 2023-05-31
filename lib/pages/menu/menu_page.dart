import 'package:payme/pages/builder.dart';
import 'package:payme/pages/intro_page.dart';
import 'package:payme/pages/menu/add_card_page.dart';
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
        bool isNotFull = user.readAllCards();
        forAddCard(isNotFull);
        String command = io.inputText("1. Yana karta qo'shish\n"
            "0. Ortga\n"
            ">>> ");
        if (command == "1") {
          forAddCard(true);
        } else {
          Menu(user);
        }
        break;
      case "2":
        forAddCard(true);
        break;
      case "3":
        //TODO: To'lov qilish
        break;
      case "4":
        //TODO: Hisobni to'ldirish
        break;
      default:
    }
  }

  void forAddCard(bool isNotFull) {
    if (isNotFull) {
      String command = io.inputText("1. Karta qo'shish\n"
          "0. Ortga\n"
          ">>> ");

      switch (command) {
        case "1":
          AddCard(user);
          break;
        case "0":
          return;
        default:
          print("Xato buyruq kiritildi!");
          builder();
      }
    }
  }
}
