import 'dart:convert';
import 'dart:math';
import '../services/io_service.dart';

///Card class Userni ichiga beriladi;
class Card {
  String name;
  int cardNumber;
  int validityYear;
  int validityMonth;
  int registeredPhoneNumber;
  bool _verified;

  Card({
    required this.name,
    required this.cardNumber,
    required this.validityYear,
    required this.validityMonth,
    required this.registeredPhoneNumber,
  }) : _verified = false;

  ///Kartani tasdiqlash uchun
  void verify() {
    int randNumber = Random().nextInt(900000) + 100000;
    int unverifiedCode = io.inputNumber(
        "Kartani tasdiqlash uchun ushbu parolni yozing ($randNumber): ");
    if (randNumber != unverifiedCode) {
      throw UnsupportedError("Kod noto'g'ri kiritildi! Qayta urining...");
    } else {
      print("Karta muvaffaqiyatli qo'shildi!");
      _verified = true;
    }
  }

  bool get verified => _verified;

  ///Databasega qo'shiladigan ma'lumotlar Map ko'rinishida bo'ladi
  ///Shuning uchun Cardni Mapga o'girib olish kerak
  Map<String, Object?> toMap() {
    return <String, Object?>{
      'name': name,
      'cardNumber': cardNumber,
      'validityYear': validityYear,
      'validityMonth': validityMonth,
      'registeredPhoneNumber': registeredPhoneNumber,
    };
  }

  ///Databasedagi ma'lumotni o'qib olish uchun
  factory Card.fromMap(Map<String, Object?> map) {
    return Card(
      name: map['name'] as String,
      cardNumber: map['cardNumber'] as int,
      validityYear: map['validityYear'] as int,
      validityMonth: map['validityMonth'] as int,
      registeredPhoneNumber: map['registeredPhoneNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Card.fromJson(String source) =>
      Card.fromMap(json.decode(source) as Map<String, Object?>);

  ///Ekranga takoy chiroyli chiqarish uchun
  @override
  String toString() {
    return "${"".padLeft(io.half, "-")} \n"
        "| ${"Name: $name".padRight(io.half - 3)}|\n"
        "| ${"Card Number: $cardNumber".padRight(io.half - 3)}|\n"
        "| ${"Validity: ${validityMonth.toString().padLeft(2, "0")}/$validityYear".padRight(io.half - 3)}|\n"
        "| ${"Registered Phone Number: $registeredPhoneNumber".padRight(io.half - 3)}|\n"
        "${"".padLeft(io.half, "-")} \n";
  }
}
