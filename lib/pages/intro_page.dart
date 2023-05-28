import '../database/users_database.dart';
import '../services/io_service.dart';
import 'builder.dart';

class IntroPage extends Builder {
  @override
  void builder() {
    super.builder();
    Center(text: "| Intro Page |");
    int phoneNumber = io.inputNumber("Raqamingizni kiriting(0 => Chiqish): ");
    if (phoneNumber == 0) {
      return;
    } else if (db.isInDataBase(phoneNumber)) {
      //TODO: Databaseda bor va undan parol so'raladi
    } else {
      //TODO: Databaseda yo'q va SignUP qilishi kerak
    }
  }
}

void main(List<String> args) {
  IntroPage();
}
