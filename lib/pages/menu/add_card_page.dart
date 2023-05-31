import 'package:payme/models/card_model.dart';
import 'package:payme/pages/menu/menu_page.dart';

import '../../models/user_model.dart';
import '../../services/io_service.dart';
import '../builder.dart';

class AddCard extends Builder {
  User user;
  AddCard(this.user);

  @override
  void builder() {
    super.builder();
    Center(text: "| Add Card Page |");

    String name = io.inputTextImportant("Karta nomini kiriting: ");
    int cardNumber = io.inputNumber("Karta raqamini kiriting: ");
    int validityYear =
        io.inputNumber("Amal qilish yili(2 xonali son ko'rinishida): ");
    int validityMonth =
        io.inputNumber("Amal qilish oyi(2 xonali son ko'rinishida): ");
    int registeredPhoneNumber =
        io.inputNumber("Ushbu kartadan ro'yhatdan o'tgan telefon raqam: ");

    user.addCard(
      Card(
          name: name,
          cardNumber: cardNumber,
          validityYear: validityYear,
          validityMonth: validityMonth,
          registeredPhoneNumber: registeredPhoneNumber),
    );
    String command = io.inputText("1. Yana qo'shish\n"
        "0. Chiqish\n"
        ">>> ");
    if (command == "1") {
      builder();
    } else {
      Menu(user);
    }
  }
}
