import 'dart:io';

class BrainFuck {
  List<String> tokens = const [">", "<", "+", "-", ",", "." "[", "]"];
  List<int> memory = List.generate(30000, (_) => 0);
  String code;

  BrainFuck({this.code = ""});
  int pos = 0;
  int pointer = 0;

  Map<int, int> buildBracemap() {
    List<int> temp = [];
    Map<int, int> bracemap = {};
    for (int i = 0; i < code.length; i++) {
      if (code[i] == '[') {
        temp.add(i);
      }
      if (code[i] == ']') {
        int last = temp.removeLast();
        bracemap[last] = i;
        bracemap[i] = last;
      }
    }
    return bracemap;
  }

  String run() {
    String out = "";
    Map<int, int> braceMap = buildBracemap();
    while (pos < code.length) {
      if (code[pos] == '>') {
        if (pointer == memory.length - 1) {
          pointer = 0;
        } else {
          pointer++;
        }
      }
      if (code[pos] == '<') {
        if (pointer == 0) {
          pointer = memory.length - 1;
        } else {
          pointer--;
        }
      }
      if (code[pos] == '+') {
        memory[pointer] = memory[pointer] < 255 ? (memory[pointer] + 1) : 0;
      }
      if (code[pos] == '-') {
        memory[pointer] = memory[pointer] > 0 ? (memory[pointer] - 1) : 255;
      }
      if (code[pos] == ',') {
        String? ip = stdin.readLineSync()?[0];
        if (ip != null && ip.isNotEmpty) {
          memory[pointer] = ip.codeUnits[0];
        }
      }
      if (code[pos] == '.') {
        stdout.add([memory[pointer]]);
        out += String.fromCharCode(memory[pointer]);
      }
      if (code[pos] == '[') {
        if (memory[pointer] == 0) {
          pos = braceMap[pos]!;
        }
      }
      if (code[pos] == ']') {
        if (memory[pointer] != 0) {
          pos = braceMap[pos]!;
        }
      }
      pos++;
    }
    // print(memory);
    return out;
  }
}
