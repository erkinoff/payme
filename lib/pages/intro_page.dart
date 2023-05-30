import '../database/users_database.dart';
import '../services/io_service.dart';
import 'auth/sign_in.dart';
import 'auth/sign_up.dart';
import 'builder.dart';

class IntroPage extends Builder {
  @override
  void builder() {
    super.builder();
    Center(text: "| Intro Page |");
    int phoneNumber = io.inputNumber("Raqamingizni kiriting(Chiqish -> 0): ");

    if (phoneNumber == 0) {
      return;
    } else if (db.isInDataBase(phoneNumber)) {
      SignIn(phoneNumber);
    } else {
      SignUp(phoneNumber);
    }
  }
}
