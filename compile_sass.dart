import 'dart:io';
import 'lib/sass.dart' as sass;

void main(List<String> arguments) {
  var result = sass.compileToResult(arguments[0]);
  File(arguments[1]).writeAsStringSync(result.css);
}

