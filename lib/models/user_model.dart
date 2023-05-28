import 'dart:convert';
import '../services/io_service.dart';
import 'card_model.dart';

///User saqlash uchun class
class User {
  int phoneNumber;
  String password;
  List<Card> cards;

  User({
    required this.phoneNumber,
    required this.password,
    List<Card>? cards,
  }) : cards = [];

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
            "2. Ortga\n"
            "0. Chiqish\n");
        switch (command) {
          case "2":
            //TODO: Ortga qaytish class
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
      if (card.name.contains(text) ||
          card.cardNumber.toString().contains(text) ||
          card.registeredPhoneNumber.toString().contains(text)) {
        result.add(card);
      }
    }
    return result;
  }

  ///Barcha Cardlar ro'yhati
  void readAllCards() {
    for (int i = 0; i < cards.length; i++) {
      OneFourth(text: "${i + 1}");
      print(cards[i]);
    }
  }

  ///Databasega saqlash uchun
  Map<String, Object?> toMap() {
    return <String, Object?>{
      'phoneNumber': phoneNumber,
      'password': password,
      'cards': cards.map((x) => x.toMap()).toList(),
    };
  }

  ///Databasedan o'qish uchun
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

///Kodlar ishlayotganini tekshirish
void main(List<String> args) {
  User user = User(phoneNumber: 1, password: "1");
  user.addCard(
    Card(
        name: "Humo",
        cardNumber: 9860600433223457,
        validityYear: 27,
        validityMonth: 08,
        registeredPhoneNumber: 993041155),
  );
  user.addCard(
    Card(
        name: "UzCard",
        cardNumber: 8600123412341234,
        validityYear: 27,
        validityMonth: 08,
        registeredPhoneNumber: 993051155),
  );
  user.readAllCards();
  String text = io.inputText("Kalit so'z: ");
  var founded = user.searchCard(text);
  for (var card in founded) {
    print(card);
  }
  String cardName = io.inputText("Karta nomi: ");
  Card? myCard = user.readCard(cardName);
  print(myCard?.toMap());
}
