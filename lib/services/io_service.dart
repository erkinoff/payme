import 'dart:io';

IOService io = IOService();

class IOService {
  int half = stdout.terminalColumns ~/ 2;

  void _console(String text) {
    stdout.write(text);
  }

  String inputText(String text) {
    _console(text);
    return stdin.readLineSync() ?? "";
  }

  int inputNumber(String text) {
    _console(text);
    return int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
  }

  String inputTextImportant(String text) {
    String result = "";
    while (result.isEmpty) {
      result = inputText(text);
    }
    return result;
  }

  String setPassword(String text) {
    String result = "";
    bool test;
    do {
      test = false;
      result = inputText(text);
      if (result.length < 8) {
        print("Parol uzunligi 8 ga teng yoki undan uzun bo'lishi kerak...");
        test = true;
      }
      if (!result.contains(RegExp(r"[A-Z]"))) {
        print("Parolda kamida 1 ta katta harf bo'lishi kerak!");
        test = true;
      }
      if (!result.contains(RegExp(r"[a-z]"))) {
        print("Parolda kamida 1 ta kichik harf bo'lishi kerak!");
        test = true;
      }
      if (!result.contains(RegExp(r"[\d]"))) {
        print("Parolda kamida 1 ta raqam bo'lishi kerak!");
        test = true;
      }
      if (!result.contains(RegExp(r"[^A-z\d]"))) {
        print("Parolda kamida 1 ta maxsus belgi bo'lishi kerak!");
        test = true;
      }
    } while (test);
    return result;
  }

  void clr() {
    print("\x1B[2J\x1B[0;0H");
  }
}

Taymer ty = Taymer();

class Taymer {
  void taymer(String text, int seconds) {
    for (int i = seconds; i > 0; i--) {
      io.clr();
      print("$text. $i...");
      sleep(Duration(seconds: 1));
    }
  }
}

class Center {
  String text;
  Center({required this.text}) {
    _printCenter();
  }

  void _printCenter() {
    final int width = stdout.terminalColumns;
    String paddedText = text.padLeft((width + text.length) ~/ 2);
    stdout.writeln(paddedText);
  }
}

class OneFourth {
  String text;
  OneFourth({required this.text}) {
    _printOneFourth();
  }

  void _printOneFourth() {
    final int width = stdout.terminalColumns;
    String paddedText = text.padLeft((width + text.length) ~/ 4);
    stdout.writeln(paddedText);
  }
}
