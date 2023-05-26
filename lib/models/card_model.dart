import 'dart:convert';
import 'dart:math';
import '../services/io_service.dart';

class Card {
  int cardNumber;
  int validityYear;
  int validityMonth;
  int registeredPhoneNumber;

  Card({
    required this.cardNumber,
    required this.validityYear,
    required this.validityMonth,
    required this.registeredPhoneNumber,
  }) {
    int randNumber = Random().nextInt(900000) + 100000;
    int unverifiedCode = io.inputNumber(
        "Kartani tasdiqlash uchun ushbu parolni yozing: $randNumber");
    if (randNumber != unverifiedCode) {
      throw UnsupportedError("Kod noto'g'ri kiritildi! Qayta urining...");
    } else {
      print("Karta muvaffaqiyatli qo'shildi!");
    }
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'cardNumber': cardNumber,
      'validityYear': validityYear,
      'validityMonth': validityMonth,
      'registeredPhoneNumber': registeredPhoneNumber,
    };
  }

  factory Card.fromMap(Map<String, Object?> map) {
    return Card(
      cardNumber: map['cardNumber'] as int,
      validityYear: map['validityYear'] as int,
      validityMonth: map['validityMonth'] as int,
      registeredPhoneNumber: map['registeredPhoneNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Card.fromJson(String source) =>
      Card.fromMap(json.decode(source) as Map<String, Object?>);
}
