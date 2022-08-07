import 'package:brainfuck_interpreter/brainfuck_interpreter.dart';
import 'package:test/test.dart';

void main() {
  group("Hello World", () {
    test('Hello, World!', () {
      expect(
        BrainFuck(
                code:
                    ">++++++++[<+++++++++>-]<.>++++[<+++++++>-]<+.+++++++..+++.>>++++++[<+++++++>-]<++.------------.>++++++[<+++++++++>-]<+.<.+++.------.--------.>>>++++[<++++++++>-]<+.")
            .run(),
        "Hello, World!",
      );
    });
    test("hello world", () {
      expect(
        BrainFuck(
                code:
                    "+[-[<<[+[--->]-[<<<]]]>>>-]>-.---.>..>.<<<<-.<+.>>>>>.>.<<.<-.")
            .run(),
        "hello world",
      );
    });
  });
}
