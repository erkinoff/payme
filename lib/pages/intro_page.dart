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
    } else if ()
  }
}

void main(List<String> args) {
  IntroPage();
}
