import 'dart:io';

import 'package:brainfuck_interpreter/brainfuck_interpreter.dart';

void main(List<String> arguments) {
  // BrainFuck(code:"+[-[<<[+[--->]-[<<<]]]>>>-]>-.---.>..>.<<<<-.<+.>>>>>.>.<<.<-.").run();
  stdout.write("BrainFuck Code: ");
  String code = stdin.readLineSync() ?? "";
  print(BrainFuck(code: code).run());
}
