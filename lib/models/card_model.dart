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
}
