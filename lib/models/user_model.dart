import 'dart:convert';
import 'package:payme/pages/menu/menu_page.dart';

import '../services/io_service.dart';
import 'card_model.dart';

///User saqlash uchun class
class User {
  int phoneNumber;
  String password;
  List<Card> cards = [];

  User({
    required this.phoneNumber,
    required this.password,
    List<Card>? userCards,
  }) {
    cards = userCards ?? [];
  }

  ///Card qo'shish
  void addCard(Card card) {
    if (card.verified) {
      cards.add(card);
    } else {
      try {
        card.verify();
        cards.add(card);
      } catch (e) {
        String command = io.inputTextImportant("1. Qayta urinish\n"
            "2. Menyuga qaytish\n"
            "0. Ortga\n");
        switch (command) {
          case "2":
            Menu(this);
            break;
          case "0":
            return;
          default:
            addCard(card);
            break;
        }
      }
    }
  }

  ///ReadCard -> Cardni name bo'yicha olish
  Card? readCard(String name) {
    for (var card in cards) {
      if (card.name == name) {
        return card;
      }
    }
    return null;
  }

  ///Cardlar orasidan izlash
  List<Card> searchCard(String text) {
    List<Card> result = [];
    for (var card in cards) {
      if (card.name.toLowerCase().contains(text.toLowerCase()) ||
          card.cardNumber.toString().contains(text) ||
          card.registeredPhoneNumber.toString().contains(text)) {
        result.add(card);
      }
    }
    return result;
  }

  ///Barcha Cardlar ro'yhati
  bool readAllCards() {
    if (cards.isEmpty) {
      print("Hali birorta ham karta yo'q!");
      return true;
    }
    for (int i = 0; i < cards.length; i++) {
      OneFourth(text: "${i + 1}");
      print(cards[i]);
    }
    return false;
  }

  ///Databasega saqlash uchun
  Map<String, Object?> toMap() {
    return <String, Object?>{
      'phoneNumber': phoneNumber,
      'password': password,
      'userCards': cards.map((x) => x.toMap()).toList(),
    };
  }

  ///Databasedan o'qish uchun
  factory User.fromMap(Map<String, Object?> map) {
    return User(
      phoneNumber: map['phoneNumber'] as int,
      password: map['password'] as String,
      userCards: List<Card>.from(
        (map['userCards'] as List<Map<String, Object?>>).map<Card>(
          (x) => Card.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, Object?>);
}
