// Extension by STER.Black for angular-package.

// Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.
import '../callable.dart';
import '../value.dart';
import '../helpers/helpers.dart';

/*
 * Sass Extension Class for String
 */
class SassExtensionString {
  static var functions = _functions;
  static var global = _global;

  final _is = function("is", r"$value", (arguments) => SassBoolean(
    switch (arguments[0]) {
      SassString() => true,
      _ => false
    })
  );

  final join = function("join", r"$delimiter, $elements...", (arguments) {
    var joined = '';
    // int i = 0;
    for (int i = 0; i < arguments[1].asList.length; i++) {
      joined = joined + (i > 0 ? arguments[0].assertString("delimiter").text : '') + arguments[1].asList[i].assertString("any").text;
    }
    return SassString(joined);
  });
}

// Initialize.
var sassExtensionString = SassExtensionString();

var _functions = <Callable>[
  sassExtensionString._is,
  sassExtensionString.join,
]; 

var _global = [
  sassExtensionString._is.withDeprecationWarning('string').withName("is-string"),
  sassExtensionString.join.withDeprecationWarning('string'),
];
