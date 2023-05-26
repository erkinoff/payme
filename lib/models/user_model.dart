import 'dart:convert';
import 'package:payme/services/io_service.dart';

import 'card_model.dart';

///User saqlash uchun class
class User {
  int phoneNumber;
  String password;
  List<Card> cards = [];

  User({
    required this.phoneNumber,
    required this.password,
    List<Card>? cards,
  }) : cards = [
          Card(
            name: "name",
            cardNumber: 1,
            validityYear: 2,
            validityMonth: 3,
            registeredPhoneNumber: 4,
          ),
          Card(
            name: "name2",
            cardNumber: 12,
            validityYear: 22,
            validityMonth: 32,
            registeredPhoneNumber: 42,
          ),
          Card(
            name: "name3",
            cardNumber: 13,
            validityYear: 23,
            validityMonth: 33,
            registeredPhoneNumber: 43,
          ),
        ];

  ///Card qo'shish
  void addCard(Card card) {
    cards.add(card);
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

  List<Card> searchCard(String text) {
    List<Card> result = [];
    for (var card in cards) {
      if (card.name.contains(text) ||
          card.cardNumber.toString().contains(text) ||
          card.registeredPhoneNumber.toString().contains(text)) {
        result.add(card);
      }
    }
    return result;
  }

  void readAllCards() {
    for (int i = 0; i < cards.length; i++) {
      OneFourth(text: "${i + 1}");
      print(cards[i]);
    }
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'phoneNumber': phoneNumber,
      'password': password,
      'cards': cards.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, Object?> map) {
    return User(
      phoneNumber: map['phoneNumber'] as int,
      password: map['password'] as String,
      cards: List<Card>.from(
        (map['cards'] as List<int>).map<Card>(
          (x) => Card.fromMap(x as Map<String, Object?>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, Object?>);
}

void main(List<String> args) {
  User user = User(phoneNumber: 1, password: "1");
  user.readAllCards();
  user.cards[0].verify();
  user.readAllCards();
}
