import 'dart:convert';
import 'card_model.dart';

class User {
  int phoneNumber;
  String password;
  List<Card> cards = [];
  User({
    required this.phoneNumber,
    required this.password,
    List<Card>? cards,
  }) : cards = [];

  void addCard(Card card) {
    cards.add(card);
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
