// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'card_model.dart';

class User {
  int phoneNumber;
  String password;
  List<Card> cards = [];
  User({
    required this.phoneNumber,
    required this.password,
  });

  void addCard(Card card) {}
}
